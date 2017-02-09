# SymfonUI.sh by f0ster
function installSymfony () {
    read -p "Do you want a specific version of Symfony? [yY/nN]" inputCompVersionYN
    if [[ $inputCompVersionYN == "y" || $inputCompVersionYN == "Y" ]]; then
      read -p "Please enter the version needed (ex : 2.8.*)" inputCompVersion
      echo "\033[32mWe're composer for you...\033[0m"
      wget https://getcomposer.org/download/1.3.2/composer.phar
      echo "\033[32mWe're installing Symfony ($inputCompVersion) for you...\033[0m"
      php composer.phar create-project symfony/symfony $inputProjectName "$inputCompVersion";
      echo "\033[32mSymfony ($inputCompVersion) has been installed correctly.\033[0m"
      cd $inputProjectName;
      echo "\033[32mWe put you in the created directory ($inputProjectName). Symfony is ready, just start a server :)\033[0m"
    fi
    if [[ $inputCompVersionYN == "n" || $inputCompVersionYN == "N" ]]; then
      echo "\033[32mWe're composer for you...\033[0m"
      wget https://getcomposer.org/download/1.3.2/composer.phar
      echo "\033[32mWe're installing Symfony for you...\033[0m"
       php composer.phar create-project symfony/symfony $inputProjectName;
      echo "\033[32mSymfony has been installed correctly.\033[0m"
      cd $inputProjectName;
      echo "\033[32mWe put you in the created directory. Symfony is ready, just start a server :)\033[0m"
    fi
}
function updateSQL () {
  echo "\033[32mHere's what we have :.\033[0m"
  php bin/console doctrine:schema:update --dump-sql;
  read -p "Do you want to force the update? [yY/nN]" inputUpdate
    if [[ $inputUpdate == "y" || $inputUpdate == "Y" ]]; then
      php bin/console doctrine:schema:update --force;
    fi
    if [[ $inputUpdate == "n" || $inputUpdate == "N" ]]; then
      echo "\033[32mit's not a shame to be afraid.\033[0m"
    fi
    break
}
function seeRoutes () {
  echo "\033[32mHere's your routes, sir!\033[0m"
  php bin/console debug:router;
}
function createSFModel () {
  echo "\033[32mYay! A new model.\033[0m"
  php bin/console doctrine:generate:model;
}
function createSFController () {
  echo "\033[32mA controller ?! Good luck with it.\033[0m"
  php bin/console doctrine:generate:controller;
}
function generateSFCRUD () {
  echo "\033[32mA controller ?! Good luck with it.\033[0m"
  php bin/console doctrine:generate:crud;
}
function installProjMate () {
  echo "\033[32mInstalling friends depencies\033[0m"
  composer install;
  echo "\033[32mChecking if symfony is correct\033[0m"
  php bin/symfony_requirements;
  echo "\033[32mCreating database (don't forget to launch MAMP and parameters.yml configed with right ports):\033[0m"
  php bin/console doctrine:database:create;
  echo "\033[32mUpdating the schema:\033[0m"
  php bin/console doctrine:schema:update --dump-sql;
  echo "\033[32mForcing the update:\033[0m"
  php bin/console doctrine:schema:update --force;
  echo "\033[32mLaunching servers:\033[0m"
  php bin/console server:run;
}
function displayMenu () {

echo "---------------------------------------------------------------------------"
echo "     *                            *                                 *      "
echo "        ______________                                   *                 "
echo "       //  __________/       SIMPLE SYMFONY GUI BY                         "
echo "      //  /____   _________  _________  ___________  ________  __________  "
echo "     //  _____/  // ____  / //  _____/ //___   ___/ //  ____/ //  ___   /  "
echo "    //  /       // /   / / //  /___       //  /    //  /___  //  /__/  /   "
echo "   //  /       // /   / / //___   /      //  /    //  ____/ //    ____/    "
echo "  //  /       // /___/ / ____//  /      //  /    //  /___  //  /\  \       "
echo " //__/       //_______/ //_____ /      //__/    //______/ //__/  \__\      "
echo "    *                                *                         *           "
echo "                  *                                *                       "
echo "---------------------------------------------------------------------------"
echo "\033[34mSymfonUI.sh \033[0mis intended to be OpenSource for all your \033[31mSymfony\033[0m needs."
echo "Please enjoy using it. Any other use is not the responsibility of the developer."
echo ""
PS3='Your choice [n]: '
echo "\033[32mBe sure you re in the path of your Symfony folder."
echo "\033[0m"
options=("Install symfony" "Open the console" "Start server" "Update your schema (+force option)" "See the routes (debug:router)" "Create a new Controller" "Create a bundle" "Create an entity" "Generate a CRUD for entity" "Install project of another" "Exit Symfonui")
select opt in "${options[@]}"
do
    case $opt in
    	"Install symfony")
			echo "-----------------------------"
            echo "\033[30m  	Installing Symfony for you! :D"
            echo "\033[0m"
            installSymfony;
            break
            ;;
        "Open the console")
      echo "---------------------------------------"
            echo "\033[31m    ''Ordinateuuuur ?'' cringy"
            echo "\033[0m"
            php bin/console;
            break
            ;;
        "Start server")
      echo "---------------------------------------"
            echo "\033[31m    @.@ I can see my shitcode now. @.@"
            echo "\033[0m"
            php bin/console server:run;
            break
            ;;
        "Update your schema (+force option)")
      echo "---------------------------------------"
            echo "\033[31m    ## Sending DATAs to The Matrix ##"
            echo "\033[0m"
            updateSQL;
            break
            ;;
        "See the routes (debug:router)")
      echo "---------------------------------------"
            echo "\033[31m    ## To the routes, please! ##"
            echo "\033[0m"
            seeRoutes;
            break
            ;;
   #      "Create a new View")
			# echo "---------------------------"
   #          echo "\033[31m  	Yay! A new page."
   #          echo "\033[0m"
   #          createSFView;
   #          break
   #          ;;
        "Create a new Controller")
      echo "---------------------------"
            echo "\033[31m    OK, a new controller."
            echo "\033[0m"
            createSFController;
            break
            ;;
        "Create a bundle")
      echo "---------------------------"
            echo "\033[31m    Buuuuuundle."
            echo "\033[0m"
            php bin/console generate:bundle;
            break
            ;;
        "Create an entity")
      echo "---------------------------"
            echo "\033[31m    Reminder, there must be a Bundle before all."
            echo "\033[0m"
            php bin/console doctrine:generate:entity;
            break
            ;;
        "Generate a CRUD for entity")
      echo "---------------------------"
            echo "\033[31m    I love cruds ! Can we eat it ?"
            echo "\033[0m"
            php bin/console doctrine:generate:crud;
            break
            ;;
        "Install project of another")
      echo "---------------------------"
            echo "\033[31m    Yay. A new project!"
            echo "\033[0m"
            installProjMate;
            break
            ;;
        "Exit Symfonui")
            echo "\033[32m    BYE :* "
            echo "\033[0m"
            break
            ;;
        *) echo invalid option;;
    esac
done
}
displayMenu;
