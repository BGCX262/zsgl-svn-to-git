package com.zsgl.preparer;

import java.util.Map;

public class TemplatePreparer2 extends AbstractPreparer {

	@Override
	protected void action(Map<String, Object> model) {
		fillOverseasCity(model);
		fillSearch(model);
		fillTjlx(model);
		fillKsdh(model);
	}

}
