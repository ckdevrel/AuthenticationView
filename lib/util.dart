import 'package:authentication_view/field_icons.dart';

class Util {

  static bool isLeftIconAvailable(int position, List<FieldIcons> fieldIcons) => (fieldIcons != null && fieldIcons.length > position && fieldIcons[position].leftIconEnabled);
}