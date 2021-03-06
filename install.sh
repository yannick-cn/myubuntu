(sudo apt-get update -y && sudo apt-get install xterm aptitude git openssh-client \
 npm flatpak    python python-pip python3-pip vim curl  gnome-tweak-tool  default-jre \
 default-jdk  git gnome-shell-extensions chrome-gnome-shell openssh-server unzip gir1.2-gtkclutter-1.0 fcitx fcitx-googlepinyin im-config  -y )

echo -e "${CYAN}Starting  : ${NC}${YELLOW}Installing required extensions${NC}"
[ ! -d ~/.local/share/gnome-shell/extensions ] && mkdir -p ~/.local/share/gnome-shell/extensions
chmod +x ./gnome-ext-install.sh
./gnome-ext-install.sh install user-theme@gnome-shell-extensions.gcampax.github.com
./gnome-ext-install.sh install dash-to-dock@micxgx.gmail.com 
# ./gnome-ext-install.sh blyr@yozoon.dev.gmail.com
# ./gnome-ext-install.sh netspeed@hedayaty.gmail.com

echo -e "${GREEN}Finished  : ${NC}${YELLOW}User Theme, Blyr, Dash to Dock, Net Speed Monitor extensions are installed.${NC}"

mkdir -p CustomizedPack
tar xvf CustomizedPack.tar.xz -C CustomizedPack
cd CustomizedPack
[ ! -d ~/.themes ] && mkdir -p ~/.themes
[ ! -d ~/.icons ] && mkdir -p ~/.icons
[ ! -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts


echo -e "${GREEN}Copying Cursor Files${NC}"
cp -r Cursor/* ~/.icons/
echo -e "${GREEN}Copying Icon Files${NC}"
cp -r Icons/* ~/.icons/
echo -e "${GREEN}Copying Shell Files${NC}"
cp -r Shell/* ~/.themes/
echo -e "${GREEN}Copying Theme Files${NC}"
cp -r Themes/* ~/.themes/
echo -e "${GREEN}Copying Fonts${NC}"
cp -r Fonts/* ~/.local/share/fonts/





#Changing UI
## Application Theme
echo -e "${BLUE}Changing Theme${NC}"
dconf write /org/gnome/desktop/interface/gtk-theme "'McOS-MJV'"

## Cursor
echo -e "${BLUE}Changing Cursor${NC}"
dconf write /org/gnome/desktop/interface/cursor-theme "'El_Capitan_CursorsMODNew'"

## Icons
echo -e "${BLUE}Changing Icons${NC}"
dconf write /org/gnome/desktop/interface/icon-theme "'MacRemix'"

## Shell
echo -e "${BLUE}Changing Shell${NC}"
dconf write /org/gnome/shell/extensions/user-theme/name "'MacOS_HS'"

## Wallpaper
#echo -e "${BLUE}Changing Wallpaper${NC}"
#dconf write /org/gnome/desktop/background/picture-uri "'file:///home/$USER/图片/macOS-mojave-Desert-5.jpg'"
#dconf write /org/gnome/desktop/background/picture-options "'zoom'"

## Lock Screen Wallpaper
#echo -e "${BLUE}Changing Lock Screen Wallpaper${NC}"
#dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///home/$USER/图片/macOS-mojave-Desert-5.jpg'"
#dconf write /org/gnome/desktop/screensaver/picture-options "'zoom'"

## Show Desktop Icons
echo -e "${BLUE}Enabling Desktop Icons${NC}"
dconf write /org/gnome/desktop/background/show-desktop-icons "true"

## Button Layout
echo -e "${BLUE}Moving Title Buttons to Left${NC}"
dconf write /org/gnome/desktop/wm/preferences/button-layout "'close,minimize,maximize:'"

##### Dash To Dock
## Monitor Placement
echo -e "${BLUE}Showing Dock on Primary Monitor Only${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/preferred-monitor "0"

## Dock Placement
echo -e "${BLUE}Changing Dock Position to Bottom${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"

## Max Icon Size
echo -e "${BLUE}Setting Max Icon Size 32${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size "32"

## Autohide
echo -e "${BLUE}Enabling Dock Autohide${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed "false"

## Show Launcher on Left
echo -e "${BLUE}Showing App Launcher on Left${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top "true"

## Mouse Scroll Action
echo -e "${BLUE}Changing Mouse Scroll Action to Cycle Windows${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/scroll-action "'cycle-windows'"

## Custom Dock Indicator
echo -e "${BLUE}Changing Dock Indicator${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-running-dots "false"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-customize-running-dots "false"

## Disable Custom Dock Shrink
echo -e "${BLUE}Disabling Custom Dock Shrink${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink "false"

## Dock Transparency Mode
echo -e "${BLUE}Changing Dock Transparency Mode${NC}"
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'DEFAULT'"

echo -e "${RED}Removing Downloaded Unnecessary Files${NC}"


(git clone https://github.com/yannick-cn/mycentos.git && cd mycentos && cp -rf icons/* ~/.icons/ && cp -rf themes/* ~/.themes/)
sudo cp -rf  ~/myubuntu/dark_background.jpg /usr/share/backgrounds/background.jpg&&\
(echo -e "Changing Wallpaper" &&\
	dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/background.jpg'" && \
	dconf write /org/gnome/desktop/background/picture-options "'zoom'")
sudo cp -rf ~/myubuntu/gdmlock.jpg /usr/share/backgrounds/gdmlock.jpg 
sudo cp -r  ~/myubuntu/block_time.jpg /usr/share/backgrounds/ && echo -e "Changing Lock Screen Wallpaper" && \
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///usr/share/backgrounds/block_time.jpg'" && \
 dconf write /org/gnome/desktop/screensaver/picture-options "'zoom'"

sudo apt-get update -y;
sudo apt-get upgrade -y;
#安装谷歌浏览器
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&sudo dpkg -i  google-chrome-stable_current_amd64.deb && rm -f google-chrome-stable_current_amd64.deb;

sudo pip install --upgrade pip && sudo pip2 install  scipy  numpy Pandas xlrd xlwt scikit-learn requests lxml pymysql PyOpenGL opencv-python pillow  -i https://pypi.tuna.tsinghua.edu.cn/simple 
sudo pip3 install --upgrade pip && sudo pip3 install  scipy matplotlib numpy Pandas xlrd xlwt scikit-learn requests lxml pymysql pylint PyOpenGL\
opencv-python pillow scrapy  jupyter notebook  -i https://pypi.tuna.tsinghua.edu.cn/simple
#安装搜狗
curl "http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb?st=cmPqDfoOMKWbaTERUm9Nmg&e=1552393910&fn=sogoupinyin_2.2.0.0108_amd64.deb" -o sougou.deb

#安装网易云音乐
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb;

#更新双系统时间
sudo apt install ntpdate && sudo ntpdate time.windows.com &&sudo hwclock --localtime --systohc 
#安装双系统界面
#(git clone https://gitee.com/guetyj/grub2-theme-breeze.git && cd grub2-theme-breeze &&sudo  chmod +x install.sh && ./install.sh)
#安装QQ等软件
(git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git && \
	cd deepin-wine-for-ubuntu && ./install.sh && \
	wget https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_2.0.0deepin4_i386.deb &&\
	sudo dpkg -i deepin.com.qq.office_2.0.0deepin4_i386.deb && \
	wget https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb &&\
	sudo dpkg -i deepin.com.wechat_2.6.2.31deepin0_i386.deb && \
	wget https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_5.7.3deepin0_i386.deb &&\
	sudo dpkg -i deepin.com.baidu.pan_5.7.3deepin0_i386.deb
	)

#设置开机动画
(tar -xvf 1469177233-dandelion.tar.gz && sudo cp -r dandelion /usr/share/plymouth/themes/ && \
	sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/dandelion/dandelion.plymouth 100 && \
	 echo -e "/usr/share/plymouth/themes/dandelion/dandelion.plymouth"|sudo update-alternatives --config default.plymouth && sudo update-initramfs -u && reboot)
