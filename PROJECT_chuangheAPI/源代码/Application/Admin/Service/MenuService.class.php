<?php
namespace Admin\Service;
/**
 * 后台菜单接口
 */
class MenuService{
	/**
	 * 获取菜单结构
	 */
	public function getAdminMenu(){
		return array(
            'index' => array(
                'name' => '首页',
                'icon' => 'home',
                'order' => 0,
                'menu' => array(
                    array(
                        'name' => '管理首页',
                        'url' => U('Admin/Index/index'),
                        'order' => 0
                    ),
					 array(
                        'name' => '自动升级',
                        'url' => U('Admin/Jnooocn/index'),
                        'order' => 0
                    )
                )
            ),
			/*'Bxcat' => array(
                'name' => '保险分类',
                //'icon' => 'u-icon-list',
                'order' => 5,
                'menu' => array(
                    array(
                        'name' => '管理保险分类',
                        'url' => U('Admin/Bxcat/index'),
                        'order' => 0
                    )
                )
            ),*/
			'User' => array(
                'name' => '前台用户管理',
                //'icon' => 'u-icon-list',
                'order' => 6,
                'menu' => array(
                    array(
                        'name' => '前台用户管理',
                        'url' => U('Admin/User/index'),
                        'order' => 0
                    ),
					array(
                        'name' => '用户分享列表管理',
                        'url' => U('Admin/ContentFLog/index'),
                        'order' => 1
                    )
                )
            ),
			'Account' => array(
						'name' => '账务管理',
						//'icon' => 'u-icon-list',
						'order' => 7,
						'menu' => array(
								array(
										'name' => '积分余额管理',
										'url' => U('Admin/Account/index'),
										'order' => 0
								),
								array(
										'name' => '现金发放管理',
										'url' => U('Admin/Moeny/index'),
										'order' => 1
								),
								array(
										'name' => '充值管理',
										'url' => U('Admin/Account/czlist'),
										'order' => 2
								),
								array(
										'name' => '微商支出明细',
										'url' => U('Admin/Weishang/index'),
										'order' => 3
								)
						)
				),
				
				'Ad' => array(
						'name' => '广告管理',
						//'icon' => 'u-icon-list',
						'order' => 7,
						'menu' => array(
								array(
										'name' => '广告管理',
										'url' => U('Admin/Ad/index'),
										'order' => 0
								),
								array(
										'name' => '点击记录',
										'url' => U('Admin/Ad/djlist'),
										'order' => 0
								),
									
						)
				),
				'APP' => array(
						'name' => 'APP设置',
						//'icon' => 'u-icon-list',
						'order' => 8,
						'menu' => array(
								array(
										'name' => 'app设置',
										'url' => U('Admin/Setting/app'),
										'order' => 0
								)
						)
				),
			/*'Bxlist' => array(
                'name' => '保险公司管理',
                //'icon' => 'u-icon-list',
                'order' => 7,
                'menu' => array(
                    array(
                        'name' => '保险公司管理',
                        'url' => U('Admin/Bxlist/index'),
                        'order' => 0
                    ),
					array(
                        'name' => '保险公司认证审核',
                        'url' => U('Admin/Prove/index'),
                        'order' => 1
                    )
                )
            ),*/
			
            'system' => array(
                'name' => '系统',
                'icon' => 'bars',
                'order' => 4,
                'menu' => array(
                    array(
                        'name' => '系统设置',
                        'url' => U('Admin/Setting/site'),
                        'order' => 0,
                        'divider' => true,
                    ),
                    array(
                        'name' => '运营设置',
                        'url' => U('Admin/Setting/yuny'),
                        'order' => 0,
                        'divider' => true,
                    ),
                	array(
                			'name' => '微商中心设置',
                			'url' => U('Admin/Setting/weishang'),
                			'order' => 1,
                			'divider' => true,
                		),
                	array(
                				'name' => '防作弊设置',
                				'url' => U('Admin/Setting/fzb'),
                				'order' => 2,
                				'divider' => true,
                	),
                    array(
                        'name' => '缓存管理',
                        'url' => U('Admin/Manage/cache'),
                        'order' => 3,
                        'divider' => true,
                    ),
                    array(
                        'name' => '安全记录',
                        'url' => U('Admin/AdminLog/index'),
                        'order' => 5
                    ),
                    array(
                        'name' => '备份还原',
                        'url' => U('Admin/AdminBackup/index'),
                        'order' => 6
                    ),
                    array(
                        'name' => '用户管理',
                        'url' => U('Admin/AdminUser/index'),
                        'order' => 7,
                        'divider' => true,
                    ),
                    array(
                        'name' => '用户组管理',
                        'url' => U('Admin/AdminUserGroup/index'),
                        'order' => 8,
                    )
                )
            ),
        );
	}
	


}
