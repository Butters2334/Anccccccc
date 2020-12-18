Anccccccc
=========

xcode插件,代码替换工具

大概是六年前写的项目,虽然现在已经不能使用了,但是记录下缅怀曾经吧

传到github之后忘记写README了,在后来xcode禁用插件之后本项目也就不能使用

编写完成后分发给了十数个群友,小圈子内评价良好

主体是通过外置控制面板增加关键字对应代码块的替换功能
>使用方式:
>>在控制面板中添加代码块和对应的key   
>>在xcode编辑中输入对应key后会直接替换为代码块

>备注:
>>xcode自带的Code Snippet应该是后来一年后才有的,因为如果自带了功能我当时也不会花大量时间写这个插件  
>>其实当时还写了其他相似的插件
>>>插件一: 可以定位到当前类在资源中的插件(类似于现在的command+shift+j)   
>>>插件二: xcode直接打开当前iOS模拟器中运行ViewController文件或者xib,可配置(源码丢失)


<img src="https://github.com/Butters2334/Anccccccc/raw/master/images/anc_xib.png"/>



依赖的第三方
>JTTMagicLine
>>主要功能依赖,提供可以在xcode中替换文本的能力

>FMDB
>>OC时代很流行的数据库管理框架,内置对sqlite3的支持

>YTKKeyValueStore
>>唐巧开发的对FMDB进行二次封装,让使用上更加便捷
