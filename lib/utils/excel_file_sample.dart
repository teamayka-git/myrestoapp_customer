/* 

            final excel = Excel.createExcel();
            final sheet = excel[excel.getDefaultSheet()!];

            sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1))
                .value = "AAA";
            sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2))
                .value = "BBB";
            sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 3))
                .value = "CCC";
            sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 4))
                .value = "DDD";
            sheet
                .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 5))
                .value = "EEE";

// excel.save(fileName: "ASDF.xlsx");//for web

//for download android
            var aaa = excel.encode();
            var path = "/storage/emulated/0/Download/cqqqaaaas.xlsx";
            var file = File(path);
            file.writeAsBytes(aaa!);*/
