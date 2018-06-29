### iOS基于jenknis的持续化步骤

#### jenknis安装
brew install jenkins
这个过程有一个默认密码，有提示存放路径，找到并登陆，创建管理员账号
下载插件

#### 配置iOS工作
新建任务-> 构建一个自由风格的软件项目。任务创建完毕

点击上一步创建的工程，进入配置选项，配置项目

* 在__General__栏的高级配置中，可以自己定义工程路径
* 源码管理配置需要项目地址
* 构建触发器，可以进行周期性任务构建，主要用到了收到推送触发打包这一条
* 构建环境，没有配置什么
* 构建，主要通过xcodebuild指令进行
* 构建后操作，下了fir插件后，可以直接上传到fir

xcodebuild 打包命令

```
pwd
workspaceName="xxx.xcworkspace"
scheme="xxx"
configurationBuildDir="./xxx/build"
configuration="enterprise"
archivePath="./xxx/xxx.xcarchive"
EnterpriseExportOptionsPlist=./exportOptionsPlist.plist
EnterpriseExportOptionsPlist=${EnterpriseExportOptionsPlist}

xcodebuild archive -workspace "$workspaceName" -scheme "$scheme" -configuration "$configuration" -archivePath "$archivePath"
xcodebuild -exportArchive -archivePath "$archivePath"  -exportPath "./rebate_iPhone" -exportOptionsPlist "$EnterpriseExportOptionsPlist"
rm -rf build
```
上面根据自己工程进行相关配置


#### iOS端配置
不能勾选自动打包命令，选择正确的profile文件，配置exportOptionsPlist.plist，里面有描述文件，打包方式这些信息


#### 证书管理，profile文件配置
这块算是最难搞得，刚开始配置的时候一直卡在这里，其实也不复杂，对iOS打包步骤不清楚导致
步骤：相关的签名证书描述文件配置到电脑，把keychain的文件复制到jenkins相关目录，mobileDevice的profile也复制到jenkins相关目录

keychain目录

```
/Users/chenliang/Library/Keychains
```

profile目录

```
Users/chenliang/Library/MobileDevice/Provisioning Profiles
```

对应的jenkins目录

```
/Users/Shared/Jenkins/Library/Keychains
```

```
/Users/Shared/Jenkins/Library/MobileDevice/Provisioning Profiles
```
我配置这些的时候，有些目录可能需要自己创建，并不存在。
到这里其实就差不多了




