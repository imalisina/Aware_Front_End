class Countries {
  List<Country> countries = getCountries();
  static List<Country> getCountries() {
    return data.map<Country>(Country.fromJSON).toList();
  }
}

class Country {
  final String name, flag, code;
  const Country({required this.name, required this.flag, required this.code});

  static Country fromJSON(json) =>
      Country(name: json['name'], flag: json['flag'], code: json['code']);
}

// !IMPORTANT! ****ADD ALL COUNTRIES WITH THEIR FLAGS****
// Country JSON data
const data = [
      {
        "name": "United States",
        "flag": "us.png",
        "code": '1'
      },
      {
        "name": "United Kingdom",
        "flag": "gb.png",
        "code": '44'
      },
      {
        "name": "China",
        "flag": "cn.png",
        "code": '86'
      },
      {
        "name": "Australia",
        "flag": "au.png",
        "code": '61'
      },
      {
        "name": "Antarctica",
        "flag": "aq.png",
        "code": '672'
      },
      {
        "name": "Austria",
        "flag": "at.png",
        "code": '43'
      },
      {
        "name": "Azerbaijan",
        "flag": "az.png",
        "code": '994'
      },
      {
        "name": "India",
        "flag": "in.png",
        "code": '91'
      },
      {
        "name": "Argentina",
        "flag": "ar.png",
        "code": '54'
      },
      {
        "name": "Bahrain",
        "flag": "bh.png",
        "code": '973'
      },
      {
        "name": "Belgium",
        "flag": "be.png",
        "code": '32'
      },
      {
        "name": "Brazil",
        "flag": "br.png",
        "code": '55'
      },
      {
        "name": "Bulgaria",
        "flag": "bg.png",
        "code": '359'
      },
      {
        "name": "Canada",
        "flag": "ca.png",
        "code": '1'
      },
      {
        "name": "China",
        "flag": "cn.png",
        "code": '86'
      },
      {
        "name": "Colombia",
        "flag": "co.png",
        "code": '57'
      },
      {
        "name": "Costa Rica",
        "flag": "cr.png",
        "code": '506'
      },
      {
        "name": "Cyprus",
        "flag": "cy.png",
        "code": '357'
      },
      {
        "name": "Czech Republic",
        "flag": "cz.png",
        "code": '420'
      },
      {
        "name": "Russia",
        "flag": "ru.png",
        "code": '7'
      },
      {
        "name": "Denmark",
        "flag": "dk.png",
        "code": '45'
      },
      {
        "name": "Egypt",
        "flag": "eg.png",
        "code": '20'
      },
      {
        "name": "Finland",
        "flag": "fi.png",
        "code": '358'
      },
      {
        "name": "France",
        "flag": "fr.png",
        "code": '33'
      },
      {
        "name": "Germany",
        "flag": "de.png",
        "code": '49'
      },
      {
        "name": "United Arab Emirates",
        "flag": "ae.png",
        "code": '971'
      },
      {
        "name": "Ukraine",
        "flag": "ua.png",
        "code": '380'
      },
      {
        "name": "Hungary",
        "flag": "hu.png",
        "code": '36'
      },
      {
        "name": "Islamic Republic of Iran",
        "flag": "ir.png",
        "code": '98'
      },
      {
        "name": "Ireland",
        "flag": "ie.png",
        "code": '353'
      },
      {
        "name": "Israel",
        "flag": "il.png",
        "code": "972"
      },
      {
        "name": "Turkey",
        "flag": "tr.png",
        "code": "90",
      },
      {
        "name": "Italy",
        "flag": "it.png",
        "code": "39"
      },
      {
        "name": "Japan",
        "flag": "jp.png",
        "code": "81"
      },
      {
        "name": "Korea",
        "flag": "kr.png",
        "code": '82'
      },
    ];
