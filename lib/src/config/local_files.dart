import 'dart:io';

const String _dataFolder = "database\\";
const String _customerFileName = "customers.txt";
const String _providerFileName = "providers.txt";
const String _productFileName = "products.txt";

enum LocalFileType {
  customerFile,
  providerFile,
  productFile,
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
    case LocalFileType.productFile:
      file = _getDataFile(_productFileName);
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
