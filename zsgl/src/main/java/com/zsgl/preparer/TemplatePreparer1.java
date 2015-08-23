package com.zsgl.preparer;

import java.util.Date;
import java.util.Map;

import com.zsgl.util.Common;

public class TemplatePreparer1 extends AbstractPreparer {

	@Override
	protected void action(Map<String, Object> model) {
		fillLxdh(model);
		fillTjlx(model);
		fillKsdh(model);
		fillSearch(model);
		model.put("now", Common.longDateFormat.format(new Date()));
	}

}
