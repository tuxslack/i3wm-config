#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     20/01/2025
# Homepage: https://github.com/tuxslack/i3wm-config
# Licença:  MIT
# Versão:   20250120
# Script:   
# Objetivo: 
#

# Ferramentas usadas para construir desktop usando o i3wm


# Script de verificação para uso inicial do i3wm para os usuários novatos.


# Quais as teclas de atalhos do Windows que podemos configurar no i3wm?


# https://i3wm.org/docs/userguide.html



# Reinicie a sessão:

# loginctl kill-user $USER

# https://linuxdicasesuporte.blogspot.com/2018/12/compositor-compton-no-i3wm.html
# https://linuxdicasesuporte.blogspot.com/2018/12/teclas-de-atalho-do-i3wm.html
# https://linuxdicasesuporte.blogspot.com/2018/12/gerenciador-de-janelas-i3-com-polybar_3.html
# https://pastebin.com/raw/43qRQQje
# https://www.youtube.com/watch?v=E1r1QauwSVY


clear




# ----------------------------------------------------------------------------------------

# Cores (tabela de cores: https://gist.github.com/avelino/3188137)

VERM="\033[1;31m"	# Deixa a saída na cor vermelho.
VERD="\033[0;32m"	# Deixa a saída na cor verde.
CIAN="\033[0;36m"	# Deixa a saída na cor ciano.

NORM="\033[0m"		# Volta para a cor padrão.


# ----------------------------------------------------------------------------------------

# Caminho para o arquivo de configuração do i3wm

I3_CONFIG="$HOME/.config/i3/config"


# ----------------------------------------------------------------------------------------

# Informações sobre o sistema:


# echo "

# Uso de memória RAM: `free -m`

# "

# ----------------------------------------------------------------------------------------


# Lista dos programas para verificar

echo -e "\nVerificar se os programas estão instalados: \n"

programas=("i3" "i3-gaps" "i3status" "i3-config-wizard" "i3blocks" "gnome-disk-utility" "xfce4-taskmanager" "xfce4-terminal" "xfce4-screenshooter" "scrot" "import" "notify-send" "i3lock" "conky" "polybar" "picom" "parcellite" "numlockx" "feh" "nitrogen"  "gimp" "simplescreenrecorder" "jq" "ffmpeg" "play" "xrandr" "dmenu" "rofi" "htop" "thunar"  "nm-applet" "pavucontrol" "alsamixer" "firefox" "soffice" "ip" "nano" "pluma" "catfish" "lxappearance" "thunderbird" "git" "wget"  "xkill" "convert" "sensors" "clamdscan" "crontab" "find" "sed" "xdg-open" "cut" "guvcview" "inxi" "qmmp-1" "mplayer" "parole" "xdotool"  "wmctrl" "neofetch" "jgmenu" "trans" "kill" "gthumb")





# ulauncher (ruim)
# dunst
# volumeicon
# policykit-1-gnome
# tint2
# plank


# Função para verificar se o programa está instalado

verificar_programa() {

    if command -v "$1" &> /dev/null; then

        echo -e "${VERD}$1 está instalado.${NORM}"

    else

        echo -e "${VERM}$1 não está instalado.${NORM}"

    fi
}


# Verificar todos os programas

for programa in "${programas[@]}"; do
    verificar_programa "$programa"
done

# ----------------------------------------------------------------------------------------

# Verificando se o arquivo ~/.config/i3/config existe.


# Para verificar qual arquivo o i3 está usando, você pode usar o comando abaixo:

# i3 --moreversion 2>&1 | head -n 5


if [[ ! -f "$I3_CONFIG" ]]; then

  echo -e "${VERM}\nArquivo de configuração do i3wm não encontrado em $I3_CONFIG \n${NORM}"

  exit 1

fi


# ----------------------------------------------------------------------------------------

echo "
Com esses programas, você terá um ambiente de desktop altamente funcional no i3wm, com 
boa usabilidade, sem perder a leveza e a personalização do i3. A configuração inicial 
pode ser um pouco trabalhosa, mas depois de tudo ajustado, o sistema será muito 
eficiente e produtivo.
"

  echo -e "${VERD}\nVersão do i3wm instalado: ${NORM} `i3 --version | awk '{print $3}'`  \n"

# ----------------------------------------------------------------------------------------

echo -e "\nVerificando configurações do i3wm...\n"



# O i3wm, 4.24, não usa mais o parâmetro border diretamente para configurar a espessura 
# das bordas das janelas. No lugar disso, essa funcionalidade foi substituída por um 
# sistema que depende da configuração de gaps e o estilo das bordas, utilizando i3-gaps






# Verificar teclas de atalho

echo -e "${VERD}\n### Teclas de Atalho ### \n${NORM}"


# ----------------------------------------------------------------------------------------

 # Procura pela linha que define a tecla modificadora (set $mod) no i3wm.


    # mod_key=$(grep -oP "^set \$(mod)\s+\K\w+" "$I3_CONFIG")
    

    # Extrai a tecla modificadora configurada

    mod_key=$(cat "$I3_CONFIG" | grep "set \$mod" | cut -d" " -f3)


    if [[ -n "$mod_key" ]]; then

        echo -e "${VERD}\nA tecla modificadora configurada no i3wm é: ${NORM} $mod_key \n"

        echo "
Mod4 é uma tecla modificadora que geralmente é associada à tecla Super (a tecla com o 
logo do Windows ou a tecla Command no macOS).

Mod1: Geralmente é associado à tecla Alt.

No arquivo de configuração do i3 (~/.config/i3/config), a tecla modificadora é 
configurada com a diretiva set $mod.


"

    else

        echo -e "${VERM}\nTecla modificadora não encontrada na configuração do i3wm. \n${NORM}"

    fi

# ----------------------------------------------------------------------------------------

# O comando grep -c "^bindsym" "$I3_CONFIG" conta as linhas que começam com bindsym, que 
# são as linhas que configuram os atalhos de teclado.

# O resultado é o número de atalhos de teclado configurados no i3wm.


    num_keybindings=$(grep -c "^bindsym" "$I3_CONFIG")

    echo -e "\nNúmero de atalhos de teclado configurados: $num_keybindings \n"


# ----------------------------------------------------------------------------------------


# Este comando utiliza o grep com a opção -E, que ativa a expressão regular estendida 
# (Extended Regular Expression, ou ERE). O grep é usado para buscar padrões em arquivos 
# de texto.

# ^bindsym: O ^ no início significa que a linha deve começar com a palavra bindsym. Ou 
# seja, o grep está procurando por todas as linhas que começam com a palavra bindsym.

# bindsym é um comando no arquivo de configuração do i3wm que define atalhos de teclado, 
# como bindsym Print para configurar a tecla Print.

# O ^bindsym no grep garante que somente as linhas que realmente começam com a palavra 
# bindsym sejam contadas, ignorando qualquer ocorrência de bindsym no meio de outras 
# linhas (por exemplo, dentro de comentários ou outros comandos).


# Atalho_Print=""


grep -E "^bindsym" "$I3_CONFIG" | while read -r line; do


  keybinding=$(echo "$line" | awk '{print $2}' | sed 's/ //g')

  command=$(echo "$line" | cut -d' ' -f4-) # | sed 's/ //g'


  echo "Atalho: $keybinding -> Comando: $command"

# Atalho: Print -> Comando: xfce4-screenshooter


# ----------------------------------------------------------------------------------------

# Verificar se o atalho é o Print

# Variável print_key_found que será marcada como true caso o atalho para a tecla "Print" 
# seja encontrado no arquivo de configuração do i3wm.

# Após listar todos os atalhos de teclado, o script verifica se a tecla Print foi 
# configurada. Caso contrário, ele exibe uma mensagem de aviso: 
# "A tecla Print não está configurada no arquivo de configuração do i3wm!".


# Verificar se a tecla Print está configurada corretamente no i3wm


  if [[ "$keybinding" == "Print" ]]; then


    # Tirar captura de tela com a tecla Print:

    # Atalho: bindsym -> Comando: Print exec xfce4-screenshooter


# Verificar se a tecla Print não foi configurada

# Print (Captura de tela): Pode ser configurada para tirar screenshots, ou outras 
# operações de captura de tela.

# bindsym Print exec xfce4-screenshooter


         echo -e "${VERD}\n### A tecla Print está configurada corretamente: $keybinding para $command \n${NORM}"


         # Configurando a variável Atalho_Print se a tecla Print estiver configurada

         # Atalho_Print="true"

  fi





comando=$(echo "$command" | awk '{print $1}')


# ----------------------------------------------------------------------------------------


# Tela de bloqueio


 if [[ "$comando" == *"i3lock"* ]]; then


         echo -e "${VERD}\n### A tecla para bloqueio de tela usando o i3lock está configurada corretamente: $keybinding para '$command' \n${NORM}"


  fi

# ----------------------------------------------------------------------------------------

# Usando o Rofi para iniciar aplicativos

# O Rofi é um launcher de aplicativos muito popular, e você pode configurá-lo para abrir com um atalho.

# bindsym $mod+d exec rofi -show run

 if [[ "$comando" == *"rofi"* ]]; then


         echo -e "${VERD}\n### A tecla para  iniciar aplicativos usando o Rofi está configurada corretamente: $keybinding para '$command' \n${NORM}"


  fi


# ----------------------------------------------------------------------------------------


# Matar janela focada


 if [[ "$comando" == *"kill"* ]]; then


         echo -e "${VERD}\n### No i3wm, o atalho Alt+F4 (bindsym Mod1+F4 kill) não é configurado por padrão para fechar janelas.\n\nA tecla para fecha janela usando o kill está configurada corretamente: $keybinding para $command \n${NORM}"


  fi


# ----------------------------------------------------------------------------------------

# Reiniciar o i3wm



 if [[ "$comando" == *"restart"* ]]; then


         echo -e "${VERD}\n### A tecla para reiniciar o i3lock está configurada corretamente: $keybinding para $command \n${NORM}"


  fi


# ----------------------------------------------------------------------------------------

# Recarregue a configuração do i3wm



 if [[ "$comando" == *"reload"* ]]; then


         echo -e "${VERD}\n### A tecla para recarregua as configurações do i3wm está configurada corretamente: $keybinding para $command \n${NORM}"


  fi


# ----------------------------------------------------------------------------------------


done


# Não funciona essa verificação


# Verificar se a tecla Print não foi configurada

#   if [[ "$Atalho_Print" == "falso" ]]; then

#        echo -e "${VERM}\n### Atenção: A tecla Print não está configurada no arquivo de configuração do i3wm! Geralmente se usar os programas: xfce4-screenshooter ou scrot \n${NORM}"

#  fi





# ----------------------------------------------------------------------------------------

# Verificar programas iniciados automaticamente

echo -e "${VERD}\n### Programas iniciados ### \n${NORM}"


# ----------------------------------------------------------------------------------------

# Conta o número de linhas que contêm "exec" (definições de comandos ou programas)

# Para garantir que apenas as linhas que começam com exec (que geralmente são as linhas 
# que iniciam programas) sejam contadas, é preciso usar o ^ no início da expressão 
# regular. O ^ especifica que a palavra exec deve estar no início da linha.


    num_programs=$(grep -c "^exec" "$I3_CONFIG")

    echo -e "\nNúmero de programas configurados para execução no i3wm: $num_programs \n"


# ----------------------------------------------------------------------------------------


grep -E "exec" "$I3_CONFIG" | while read -r line; do

  command=$(echo "$line" | cut -d' ' -f2-)

  echo "Programa: $command"

done

# ----------------------------------------------------------------------------------------


# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

# Verifica se Polybar esta desativada.

# cp /etc/i3status.conf  ~/.i3status.conf
      

# bar {
#          status_command i3status

         # Por padrão, a barra de status do i3 fica na parte inferior. Para colocá-lo na parte superior da tela.

#          position top
# }

# ----------------------------------------------------------------------------------------



echo -e "${VERD}\nVerificação concluída! \n${NORM}"



exit 0

