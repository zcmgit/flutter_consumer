class BannerEntity {
	List<BannerBeanList> list;

	BannerEntity({this.list});

	BannerEntity.fromJson(Map<String, dynamic> json) {
		if (json['list'] != null) {
			list = new List<BannerBeanList>();(json['list'] as List).forEach((v) { list.add(new BannerBeanList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.list != null) {
      data['list'] =  this.list.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class BannerBeanList {
	int sourceType;
	String source;
	String url;

	BannerBeanList({this.sourceType, this.source, this.url});

	BannerBeanList.fromJson(Map<String, dynamic> json) {
		sourceType = json['sourceType'];
		source = json['source'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sourceType'] = this.sourceType;
		data['source'] = this.source;
		data['url'] = this.url;
		return data;
	}
}
