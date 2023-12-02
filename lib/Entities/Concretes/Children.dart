class Children{
  String? _parent_phone;
  String? _school_id;
  String? _service_code;

  String? get ParentPhone{
    return this._parent_phone;
  }

  String? get SchoolId{
    return this._school_id;
  }

  String? get ServiceCode{
    return this._service_code;
  }

  void set ParentPhone(String? parent_phone){
    this._parent_phone=parent_phone;
  }

  void set SchoolId(String? school_id){
    this._school_id=school_id;
  }

  void set ServiceCode(String? service_code){
    this._service_code=service_code;
  }

}