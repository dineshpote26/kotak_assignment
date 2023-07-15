class GetInitials{
  const GetInitials._();

  //handles multiple spaces also
  static String getInitials(String bankAccountName) =>
      bankAccountName.isNotEmpty
          ? bankAccountName
          .trim()
          .split(RegExp(' +'))
          .map((s) => s[0])
          .take(2)
          .join()
          .toUpperCase()
          : '';

}