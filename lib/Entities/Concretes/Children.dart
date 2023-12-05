class Children{
  String? _parent_phone;
  String? _school_id;
  String? _shuttleKey;

  String? get ParentPhone{
    return this._parent_phone;
  }

  String? get SchoolId{
    return this._school_id;
  }

  void set ParentPhone(String? parent_phone){
    this._parent_phone=parent_phone;
  }

  void set SchoolId(String? school_id){
    this._school_id=school_id;
  }

  String? get shuttleKey{
    return this._shuttleKey;
  }

  void set shuttleKey(String? shuttleKey){
    this._shuttleKey=shuttleKey;
  }

}