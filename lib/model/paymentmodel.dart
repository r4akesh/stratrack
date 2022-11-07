class PaymentModel {
	String? message;
	int? code;
	//
	PaymentModel({this.message, this.code});

	PaymentModel.fromJson(Map<String, dynamic> json) {
		message = json['message'];
		code = json['code'];
	//	data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['message'] = this.message;
		data['code'] = this.code;
		// if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
		return data;
	}
}

// class Data {


// 	Data({});

// 	Data.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }