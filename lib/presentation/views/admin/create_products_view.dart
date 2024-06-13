import 'dart:typed_data';
import 'package:cutap/presentation/blocs/products/products_cubit.dart';
import 'package:cutap/presentation/widgets/client/inputs/admins_form_input.dart';
import 'package:cutap/utils/image_converter/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductView extends StatefulWidget {
  final ScrollController scrollController;
  const CreateProductView({
    super.key,
    required this.scrollController,
  });

  @override
  State<CreateProductView> createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  XFile? _selectedImage;
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_selectedImage != null) {
        _imageBytes = await convertImageToBytes(_selectedImage!);
        if (mounted) {
          context.read<ProductsCubit>().imagenChanged(_imageBytes);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsCubit = context.watch<ProductsCubit>();
    final nombre = productsCubit.state.nombre;
    final cantidad = productsCubit.state.cantidad;
    final precio = productsCubit.state.precio;
    final isValid = productsCubit.state.isValid;
    final formStatus = productsCubit.state.formStatus;

    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 13),
            Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 212, 214),
                  borderRadius: BorderRadius.circular(16)),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Crear producto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
            //Input del nombre
            AdminCustomInput(
              hint: 'Empanada',
              title: 'Nombre',
              onChanged: productsCubit.nombreChanged,
              errorMessage: nombre.getErrorMessage,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AdminCustomInput(
                    title: 'Cantidad',
                    hint: '10',
                    onChanged: productsCubit.cantidadChanged,
                    errorMessage: cantidad.getErrorMessage,
                  ),
                ),
                const SizedBox(width: 16), // Espacio entre los dos inputs
                Expanded(
                  child: AdminCustomInput(
                    title: 'Precio',
                    hint: '10.000COP',
                    onChanged: productsCubit.precioChanged,
                    errorMessage: precio.getErrorMessage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Imagen del producto',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: _pickImageFromGallery,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _selectedImage != null
                                  ? (_selectedImage!.name.length > 10
                                      ? '${_selectedImage!.name.substring(0, 15)}...'
                                      : _selectedImage!.name)
                                  : 'Carga aqui',
                              style: const TextStyle(
                                color: Color(0xFF6A6A6A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.upload_file_rounded)
                          ],
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: isValid ? () => productsCubit.onSubmit(context) : null,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: formStatus == FormStatus.posting
                          ? const Color.fromARGB(255, 0, 66, 165)
                          : const Color(0xFF0066FF),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Agregar producto',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 5,
                      ),
                      formStatus == FormStatus.posting
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Iconsax.add,
                              color: Colors.white,
                              weight: 2,
                            ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      _selectedImage = returnedImage;
      _imageBytes = await convertImageToBytes(_selectedImage!);
      context.read<ProductsCubit>().imagenChanged(_imageBytes);
    }

    setState(() {
      _selectedImage = returnedImage;
    });
  }
}
