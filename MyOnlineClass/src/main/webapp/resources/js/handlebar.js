var ERROR_MESSAGE = {
	NEW_ERROR: "new 생성자를 사용하지 않았습니다.",
	NOT_CORRECT_DATA: "데이터를 잘못 입력했습니다.",
}

var validateData = function (data) {
	try {
		if (!data || !data instanceof Object) {
			throw new Error(ERROR_MESSAGE.NOT_CORRECT_DATA);
		}
	} catch (error) {
		console.warn(error);
	}
}

var HandleBars = function (data, templateEleSlc, itemListEle) {
	validateData(data);
	this.data = data || {};
	this.templateEleSlc = templateEleSlc;
	this.itemListEle = itemListEle;

	if (this === window) {
		throw new Error(ERROR_MESSAGE.NEW_ERROR);
	}

	this.setTemplate = function (templateEleSlc) {
		var $templateEle = $(templateEleSlc);
		var $template = Handlebars.compile($templateEle.html());
		return $template;
	}

	this.setItemList = function (itemListEle) {
		var $itemListEle = $(itemListEle);
		return $itemListEle;
	}
}

//new HandleBars의 setTemplate,setItemList의 엘리먼트를 받아서 DOM에 render링 해준다.
HandleBars.prototype.render = function () {
	var $itemList = this.setTemplate(this.templateEleSlc)(this.data);

	this.setItemList(this.itemListEle).html($itemList);
}

Handlebars.registerHelper("inc", function (value, options) {
	return parseInt(value) + 1;
});

Handlebars.registerHelper("select", function (value, options) {

	var html, select;


	select = document.createElement("div");


	$(select).html(options().replace(/<[/]*\$data:\w+>/g, ""));


	$("input[type=radio]", select).filter("[value='" + value + "']").attr('checked', 'checked');


	$("option", select).filter("[value='" + value + "']").attr('selected', 'selected');


	return select.innerHTML;

});

