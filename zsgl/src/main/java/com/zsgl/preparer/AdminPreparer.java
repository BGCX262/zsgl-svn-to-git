package com.zsgl.preparer;

import java.util.Map;

/**
 * 填充后台菜单数据
 * @author itachi
 *
 */
public class AdminPreparer extends AbstractPreparer {

	@Override
	protected void action(Map<String, Object> model) {
		fillLxdh(model);
		fillAccountType(model);
	}

}
