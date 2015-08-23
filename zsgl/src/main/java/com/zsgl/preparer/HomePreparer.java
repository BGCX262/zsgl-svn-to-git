package com.zsgl.preparer;

import java.util.Map;

public class HomePreparer extends AbstractPreparer {

	@Override
	protected void action(Map<String, Object> model) {
		fillAbout(model);
		fillLxdh(model);
		fillTjlx(model);
		fillOrder(model);
		fillKsdh(model);
	}

}
