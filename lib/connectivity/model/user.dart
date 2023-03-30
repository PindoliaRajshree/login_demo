import 'dart:convert';

/// id : 1
/// token : "c112b170"
/// slug : "gajendra-aimerse"
/// url_profile : "https://demo.aimerse.com/iservice-v2/public/image/user/1/profile/gajendra-aimerse-658435587-1679144501.webp"
/// url_images : ""
/// name : "Gajendra Aimerse"
/// email : "aimerse.gajendra@gmail.com"
/// email_verified : "yes"
/// email_verified_at : "2023-03-19 16:51:44"
/// mobile_code : "91"
/// mobile : "8319742402"
/// mobile_verified : "yes"
/// mobile_verified_at : "2023-03-13 22:34:10"
/// alt_mobile : ""
/// gender : ""
/// dob : ""
/// user_type : "client"
/// is_engineer : "no"
/// is_delivery_boy : "no"
/// is_distributor : "no"
/// status : "active"
/// assigned_agent_id : ""
/// token_assigned_agent : ""
/// assigned_agent_at : ""
/// device_token : "ABCDEFGHIJK"
/// password : "$2y$10$e3y5xhokqdaYLTsOXFvjKu3eeNWkItI08GSqe7y5RuB2no1oTEM9a"
/// remember_token : ""
/// updated_at : "2023-03-21 08:18:43"
/// updated_by : 1
/// updated_user_type : "super_admin"
/// created_at : "2023-03-07 04:46:20"
/// created_by : 1
/// created_user_type : "super_admin"

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    int? id,
    String? token,
    String? slug,
    String? urlProfile,
    String? urlImages,
    String? name,
    String? email,
    String? emailVerified,
    String? emailVerifiedAt,
    String? mobileCode,
    String? mobile,
    String? mobileVerified,
    String? mobileVerifiedAt,
    String? altMobile,
    String? gender,
    String? dob,
    String? userType,
    String? isEngineer,
    String? isDeliveryBoy,
    String? isDistributor,
    String? status,
    String? assignedAgentId,
    String? tokenAssignedAgent,
    String? assignedAgentAt,
    String? deviceToken,
    String? password,
    String? rememberToken,
    String? updatedAt,
    int? updatedBy,
    String? updatedUserType,
    String? createdAt,
    int? createdBy,
    String? createdUserType,
  }) {
    _id = id;
    _token = token;
    _slug = slug;
    _urlProfile = urlProfile;
    _urlImages = urlImages;
    _name = name;
    _email = email;
    _emailVerified = emailVerified;
    _emailVerifiedAt = emailVerifiedAt;
    _mobileCode = mobileCode;
    _mobile = mobile;
    _mobileVerified = mobileVerified;
    _mobileVerifiedAt = mobileVerifiedAt;
    _altMobile = altMobile;
    _gender = gender;
    _dob = dob;
    _userType = userType;
    _isEngineer = isEngineer;
    _isDeliveryBoy = isDeliveryBoy;
    _isDistributor = isDistributor;
    _status = status;
    _assignedAgentId = assignedAgentId;
    _tokenAssignedAgent = tokenAssignedAgent;
    _assignedAgentAt = assignedAgentAt;
    _deviceToken = deviceToken;
    _password = password;
    _rememberToken = rememberToken;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _updatedUserType = updatedUserType;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _createdUserType = createdUserType;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _token = json['token'];
    _slug = json['slug'];
    _urlProfile = json['url_profile'];
    _urlImages = json['url_images'];
    _name = json['name'];
    _email = json['email'];
    _emailVerified = json['email_verified'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobileCode = json['mobile_code'];
    _mobile = json['mobile'];
    _mobileVerified = json['mobile_verified'];
    _mobileVerifiedAt = json['mobile_verified_at'];
    _altMobile = json['alt_mobile'];
    _gender = json['gender'];
    _dob = json['dob'];
    _userType = json['user_type'];
    _isEngineer = json['is_engineer'];
    _isDeliveryBoy = json['is_delivery_boy'];
    _isDistributor = json['is_distributor'];
    _status = json['status'];
    _assignedAgentId = json['assigned_agent_id'];
    _tokenAssignedAgent = json['token_assigned_agent'];
    _assignedAgentAt = json['assigned_agent_at'];
    _deviceToken = json['device_token'];
    _password = json['password'];
    _rememberToken = json['remember_token'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _updatedUserType = json['updated_user_type'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _createdUserType = json['created_user_type'];
  }

  int? _id;
  String? _token;
  String? _slug;
  String? _urlProfile;
  String? _urlImages;
  String? _name;
  String? _email;
  String? _emailVerified;
  String? _emailVerifiedAt;
  String? _mobileCode;
  String? _mobile;
  String? _mobileVerified;
  String? _mobileVerifiedAt;
  String? _altMobile;
  String? _gender;
  String? _dob;
  String? _userType;
  String? _isEngineer;
  String? _isDeliveryBoy;
  String? _isDistributor;
  String? _status;
  String? _assignedAgentId;
  String? _tokenAssignedAgent;
  String? _assignedAgentAt;
  String? _deviceToken;
  String? _password;
  String? _rememberToken;
  String? _updatedAt;
  int? _updatedBy;
  String? _updatedUserType;
  String? _createdAt;
  int? _createdBy;
  String? _createdUserType;

  int? get id => _id;

  String? get token => _token;

  String? get slug => _slug;

  String? get urlProfile => _urlProfile;

  String? get urlImages => _urlImages;

  String? get name => _name;

  String? get email => _email;

  String? get emailVerified => _emailVerified;

  String? get emailVerifiedAt => _emailVerifiedAt;

  String? get mobileCode => _mobileCode;

  String? get mobile => _mobile;

  String? get mobileVerified => _mobileVerified;

  String? get mobileVerifiedAt => _mobileVerifiedAt;

  String? get altMobile => _altMobile;

  String? get gender => _gender;

  String? get dob => _dob;

  String? get userType => _userType;

  String? get isEngineer => _isEngineer;

  String? get isDeliveryBoy => _isDeliveryBoy;

  String? get isDistributor => _isDistributor;

  String? get status => _status;

  String? get assignedAgentId => _assignedAgentId;

  String? get tokenAssignedAgent => _tokenAssignedAgent;

  String? get assignedAgentAt => _assignedAgentAt;

  String? get deviceToken => _deviceToken;

  String? get password => _password;

  String? get rememberToken => _rememberToken;

  String? get updatedAt => _updatedAt;

  int? get updatedBy => _updatedBy;

  String? get updatedUserType => _updatedUserType;

  String? get createdAt => _createdAt;

  int? get createdBy => _createdBy;

  String? get createdUserType => _createdUserType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['token'] = _token;
    map['slug'] = _slug;
    map['url_profile'] = _urlProfile;
    map['url_images'] = _urlImages;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified'] = _emailVerified;
    map['email_verified_at'] = _emailVerifiedAt;
    map['mobile_code'] = _mobileCode;
    map['mobile'] = _mobile;
    map['mobile_verified'] = _mobileVerified;
    map['mobile_verified_at'] = _mobileVerifiedAt;
    map['alt_mobile'] = _altMobile;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['user_type'] = _userType;
    map['is_engineer'] = _isEngineer;
    map['is_delivery_boy'] = _isDeliveryBoy;
    map['is_distributor'] = _isDistributor;
    map['status'] = _status;
    map['assigned_agent_id'] = _assignedAgentId;
    map['token_assigned_agent'] = _tokenAssignedAgent;
    map['assigned_agent_at'] = _assignedAgentAt;
    map['device_token'] = _deviceToken;
    map['password'] = _password;
    map['remember_token'] = _rememberToken;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['updated_user_type'] = _updatedUserType;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['created_user_type'] = _createdUserType;
    return map;
  }
}
