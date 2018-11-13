# SqliteModelORMGenerator
covert oc model into Sqlite ORM Entity code in xcode log console.then you can copy this code in .m file,then you can use the class functions(createTable+deleteTable+selectWhere+selectAll+insertWithObject(s)+updateWithObject(s)) to perform your persistence actions with sqlite)

A ios objc entity orm code generator tool/一款ios端实体映射代码生成工具。旨在帮助大家提高运行开发效率。（目前有一个开源库，运用的原理都是动态运行时映射。但它是操作的时候动态去映射，我只是预先生成好代码，旨在提高运行效率。）
#最终生成的.h文件中对应的数据库增删改查方法。  
![iPhone或者iPad对应的生成NSLog代码控制页面](https://github.com/FuLingTaiHexiaoke/SqliteModelORMGenerator/tree/master/SqliteModelORMGeneratorDemo/SqliteModelORMGeneratorDemo/Resource/FLXK_ORM_EntityGenerator_static.png)  
#Mac中Xcode控制台显示生成NSLog代码，此代码对应我们需要的数据库增删改查方法。复制此代码到对应的.m文件中即可。      
![Mac中Xcode控制台显示生成NSLog代码](https://github.com/FuLingTaiHexiaoke/SqliteModelORMGenerator/tree/master/SqliteModelORMGeneratorDemo/SqliteModelORMGeneratorDemo/Resource/FLXK_ORM_EntityGenerator1.gif)  
#iPhone或者iPad对应的生成NSLog代码控制页面，复制列表中的实体类名字，然后点击generate。就可以在Mac中Xcode控制台显示生成NSLog代码。    
![iPhone或者iPad对应的生成NSLog代码控制页面](https://github.com/FuLingTaiHexiaoke/SqliteModelORMGenerator/tree/master/SqliteModelORMGeneratorDemo/SqliteModelORMGeneratorDemo/Resource/FLXK_ORM_EntityGenerator2.gif)  
