import 'dart:io';

const String _dataFolder = "database\\";
const String _customerFileName = "customers.txt";
const String _providerFileName = "providers.txt";

enum LocalFileType {
  customerFile,
  providerFile,
}

File getLocalFile(LocalFileType fileType) {
  File file;
  switch (fileType) {
    case LocalFileType.customerFile:
      file = _getDataFile(_customerFileName);
      break;
    case LocalFileType.providerFile:
      file = _getDataFile(_providerFileName);
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
