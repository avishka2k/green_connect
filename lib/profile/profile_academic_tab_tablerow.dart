import 'package:flutter/material.dart';

class ProfileAcademicTabTableRow extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final semester;
  final List<Map<String, dynamic>> rowData;

  const ProfileAcademicTabTableRow({
    Key? key,
    required this.semester,
    required this.rowData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          semester,
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: rowData.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = rowData[index];
            return Table(
              columnWidths: const {
                0: FixedColumnWidth(60.0),
                2: FixedColumnWidth(30.0),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(item['module_code'].toString().toUpperCase(),
                          style: const TextStyle(fontSize: 12.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(item['module_title'].toString(),
                          style: const TextStyle(fontSize: 12.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                          item['module_result'].toString().toUpperCase(),
                          style: const TextStyle(fontSize: 12.0)),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ProfileAcademicTabCellItem {
  final String moduleCode;
  final String moduleTitle;
  final String moduleResult;

  ProfileAcademicTabCellItem({
    required this.moduleCode,
    required this.moduleTitle,
    required this.moduleResult,
  });
}
