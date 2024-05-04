class OurTeam{
  List<Member> ourTeamList=[];

  OurTeam.fromJson(Map<String,dynamic>json){
    ourTeamList=(json['members'] as List)
        .map((e) =>Member.fromJson(e)).toList();
  }


}

class Member{
  late int id;
  String member_picture='';
  Name? name;
  MemberPposition?memberPposition;
  MemberDesc?memberDesc;
  MemberSkills?memberSkills;
  
  Member.fromJson(Map<String,dynamic>json){
    id=json['pk'];
    member_picture=json['member_picture_mobile'];
    name=Name.fromJson(json['member_name']);
    memberPposition=MemberPposition.fromJson(json['member_position']);
    memberDesc=MemberDesc.fromJson(json['member_desc']);
    memberSkills=MemberSkills.fromJson(json['member_skills']);
  }



}

class Name{
    String ar='';
    String en='';

    Name.fromJson(Map<String,dynamic>json){
      ar=json['AR'];
      en=json['EN'];
    }
}

class MemberPposition{
  String ar='';
  String en='';

  MemberPposition.fromJson(Map<String,dynamic>json){
    ar=json['AR'];
    en=json['EN'];
  }
}

class MemberDesc {
  String ar = '';
  String en = '';

  MemberDesc.fromJson(Map<String, dynamic>json){
    ar = json['AR'];
    en = json['EN'];
  }
}
class MemberSkills{
  String ar = '';
  String en = '';

  MemberSkills.fromJson(Map<String, dynamic>json){
    ar = json['AR'];
    en = json['EN'];
  }

}