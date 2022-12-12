#1/bin/bash

Color_green="\033[1;92m"
Color_default="\033[0;0m"
Color_red="\033[1;31m"
Color_purple="\033[1;35m"
Color_blue="\033[1;34m"
Color_cyan="\033[1;36m"
Color_yellow="\033[1;33m"

memory_status(){
	echo "Ultilização de memoria:"
	free
	read -p "Precione alguma tecla para continuar... "
}
disk_status(){
	echo "Ultilização de disco:"
	df
	read -p "Precione alguma tecla para continuar... "
}
conection_status(){
	echo "Conectividade com internet..."
	Ping1=$(ping -c 2 8.8.8.8 > /dev/null);
	if [ $? -eq 0 ];then
	echo -e "${Color_green} |Conectado| ${Color_default}"
	else
	echo -e "${Color_red} |Desconectado| ${Color_default}"
	fi
	read -p "Precione alguma tecla para continuar... "
}
programs_status(){
	echo "Aplicativos que estão rodando no momento:"
	ps aux
	read -p "Precione alguma tecla para continuar... "
}
system_info(){
	uptime_time=$(uptime -p);
	uptime_time_since=$(uptime -s);
	echo -e "O sistema está ligado á ${Color_green}$uptime_time${Color_default}"
	echo -e "O sistema está ativo desde ${Color_green}$uptime_time_since${Color_default}"
	read -p "Precione alguma tecla para continuar... "
}
ascii_test(){
	echo -e "${Color_green}___  ___ _____  _   _  _   _ "
	echo "|  \/  ||  ___|| \ | || | | |"
	echo "| .  . || |__  |  \| || | | |"
	echo "| |\/| ||  __| | .   || | | |"
	echo "| |  | || |___ | |\  || |_| |"
	echo -e "\_|  |_/\____/ \_| \_/ \___/${Color_default} "
	read -p "Precione alguma tecla para continuar... "
}
menu(){
	clear
	name=$(whoami);
	echo "|Bem-vindo, $name"
	#date "+Data: %D%nHora: %T"
	echo -e "${Color_purple}|${Color_default}${Color_purple}=+=+=+=++==-MENU-==+=+=+=+=+=+=${Color_default}${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}1.- ${Color_blue}Ultilização de memoria.${Color_default}    ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}2.- ${Color_cyan}Ultilização de disco.${Color_default}      ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}3.- ${Color_green}Conectividade com internet.${Color_default}${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}4.- ${Color_yellow}Processos.${Color_default}                 ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}5.- ${Color_red}informações do sistema.${Color_default}    ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}6.- ${Color_purple}Sair. ${Color_default}                     ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}7.- ${Color_blue}Ascii. ${Color_default}                    ${Color_purple}|${Color_default}"
	echo -e "${Color_purple}|${Color_default}${Color_purple}=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=${Color_default}${Color_purple}|${Color_default}"
}
inputs(){
	local choice
	read -p "|Escolha a opção: " choice
	echo -e "${Color_purple}|${Color_default}${Color_purple}=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=${Color_default}${Color_purple}|${Color_default}"
	case $choice in
	1) memory_status ;;
	2) disk_status ;;
	3) conection_status ;;
	4) programs_status ;;
	5) system_info ;;
	6) exit 0 ;;
	7) ascii_test ;;
	*) echo "Resposta invalida"
		read -p "Precione alguma tecla para continuar... "
	esac
}

while true
do
	menu
	inputs
done
