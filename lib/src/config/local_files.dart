import 'dart:io';

const String _dataFolder = "database\\";
const String _customerFileName = "customers.txt";

enum LocalFileType {
  customerFile,
}

File getLocalFile(LocalFileType fileType) {
  File file;
  switch (fileType) {
    case LocalFileType.customerFile:
      file = _getDataFile(_customerFileName);
      break;
    default:
      throw FileSystemException();
  }

  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  return file;
}

File _getDataFile(String fileName) {
  return File("$_dataFolder$fileName");
}
