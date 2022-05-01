part of './home_page.dart';

class UserSection extends StatefulWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  State<UserSection> createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  final _nameController = TextEditingController();
  final _firstLastNameController = TextEditingController();
  final _secondLastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEditingMode = false;

  @override
  void initState() {
    super.initState();
    final _user = context.read<UserProvider>().user;
    _nameController.text = _user!.name;
    _firstLastNameController.text = _user.firstLastName;
    _secondLastNameController.text = _user.secondLastName;
    _phoneController.text = _user.phone;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _firstLastNameController.dispose();
    _secondLastNameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                children: [
                  InputWithValidation(
                    controller: _nameController,
                    label: 'Nombre',
                    onChanged: (value) {
                      _nameController.text = value;
                      setState(() => isEditingMode = true);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vació';
                      return null;
                    },
                  ),
                  InputWithValidation(
                    controller: _firstLastNameController,
                    label: 'Apellido Paterno',
                    onChanged: (value) {
                      _firstLastNameController.text = value;
                      setState(() => isEditingMode = true);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vació';
                      return null;
                    },
                  ),
                  InputWithValidation(
                    controller: _secondLastNameController,
                    label: 'Apellido materno',
                    onChanged: (value) {
                      _secondLastNameController.text = value;
                      setState(() => isEditingMode = true);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vació';
                      return null;
                    },
                  ),
                  InputWithValidation(
                    controller: _phoneController,
                    label: 'Teléfono',
                    onChanged: (value) {
                      _phoneController.text = value;
                      setState(() => isEditingMode = true);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Campo vació';
                      return null;
                    },
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    title: 'Guardar',
                    titleColor:
                        (isEditingMode == true) ? Colors.white : Colors.blue,
                    buttonColor: (isEditingMode == true)
                        ? Colors.blue
                        : Colors.blue.withOpacity(.6),
                    onPressed: () => updateUser(),
                    borderRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateUser() {
    context.read<UserProvider>().updateUserData(
          name: _nameController.text,
          fLastName: _firstLastNameController.text,
          sLastName: _secondLastNameController.text,
          phone: _phoneController.text,
        );
    Navigator.of(context).pop();
  }
}
