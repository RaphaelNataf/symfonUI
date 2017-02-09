# SymfonUI.sh by f0ster
function returnMenu(){
  # read -p "Back to menu ? [yY/nN]" inputMenuYN
  #   if [[ $inputMenuYN == "y" || $inputMenuYN == "Y" ]]; then
      displayMenu;
    # else
    #   wantToexit;
    # fi
}
function installSymfony(){
  echo "-----------------------------";
  echo "\033[30m    Installing Symfony for you! :D";
  echo "\033[0m";
    read -p "Name of your Symfony App : " inputProjectName;
    nameOfProject = 'cd $inputProjectName';
    read -p "Do you want a specific version of Symfony? [yY/nN]" inputCompVersionYN;
    if [[ $inputCompVersionYN == "y" || $inputCompVersionYN == "Y" ]]; then
      read -p "Please enter the version needed (ex : 2.8.*)" inputCompVersion;
      echo "\033[32mWe're getting composer for you...\033[0m";
      wget https://getcomposer.org/download/1.3.2/composer.phar;
      echo "\033[32mWe're installing Symfony ($inputCompVersion) for you...\033[0m";
      php composer.phar create-project symfony/symfony $inputProjectName "$inputCompVersion";
      echo "\033[32mSymfony ($inputCompVersion) has been installed correctly.\033[0m";
    fi
    if [[ $inputCompVersionYN == "n" || $inputCompVersionYN == "N" ]]; then
      echo "\033[32mWe're getting composer for you...\033[0m";
      wget https://getcomposer.org/download/1.3.2/composer.phar;
      echo "\033[32mWe're installing Symfony for you...\033[0m";
      php composer.phar create-project symfony/symfony $inputProjectName;
      echo "\033[32mSymfony has been installed correctly.\033[0m";
    fi
    echo "\033[32mWe put you in the created directory ($inputProjectName). Symfony is ready, just start a server :)\033[0m";

}
function updateSchema(){
  echo "---------------------------------------";
  echo "\033[31m    ## Sending DATAs to The Matrix ##";
  echo "\033[0m";
  echo "\033[32mHere's what we have :.\033[0m";
  php bin/console doctrine:schema:update --dump-sql;
  read -p "Do you want to force the update? [yY/nN]" inputUpdate;
    if [[ $inputUpdate == "y" || $inputUpdate == "Y" ]]; then
      php bin/console doctrine:schema:update --force;
    fi
    if [[ $inputUpdate == "n" || $inputUpdate == "N" ]]; then
      echo "\033[32mit's not a shame to be afraid.\033[0m";
    fi
    returnMenu;
}
function seeRoutes(){
  echo "---------------------------------------";
  echo "\033[31m    ## To the routes, please! ##";
  echo "\033[0m";
  echo "\033[32mHere's your routes, sir!\033[0m";
  php bin/console debug:router;
  returnMenu;
}
function openConsole(){
  echo "---------------------------------------";
  echo "\033[31m    ''Ordinateuuuur ?'' cringy";
  echo "\033[0m";
  php bin/console;
  returnMenu;
}
function startServers(){
  echo "---------------------------------------";
  echo "\033[31m    @.@ I can see my shitcode now. @.@";
  echo "\033[0m";
  php bin/console server:run;
  returnMenu;
}
function createEntity(){
  echo "---------------------------"
  echo "\033[31m    Reminder, there must be a Bundle before all.";
  echo "\033[0m";
  php bin/console doctrine:generate:entity;
}
function createBundle(){
  echo "---------------------------";
  echo "\033[31m    Buuuuuundle.";
  echo "\033[0m";
  php bin/console generate:bundle;
  returnMenu;
}

function createSFModel(){
  echo "\033[32mYay! A new model.\033[0m";
  php bin/console doctrine:generate:model;
  returnMenu;
}
function createSFController(){
  echo "---------------------------";
  echo "\033[31m    OK, a new controller.";
  echo "\033[0m";
  echo "\033[32mA controller ?! Good luck with it.\033[0m";
  php bin/console generate:controller;
  returnMenu;
}
function generateSFCRUD(){
  echo "---------------------------";
  echo "\033[31m    I love cruds ! Can we eat it ?";
  echo "\033[0m";
  php bin/console doctrine:generate:crud;
  returnMenu;
}
function installProjMate(){
  echo "---------------------------";
  echo "\033[31m    Yay. A new project!";
  echo "\033[0m";
  echo "\033[32mInstalling friends depencies\033[0m";
  composer install;
  echo "\033[32mChecking if symfony is correct\033[0m";
  php bin/symfony_requirements;
  echo "\033[32mCreating database (don't forget to launch MAMP and parameters.yml configed with right ports):\033[0m";
  php bin/console doctrine:database:create;
  echo "\033[32mUpdating the schema:\033[0m";
  php bin/console doctrine:schema:update --dump-sql;
  echo "\033[32mForcing the update:\033[0m";
  php bin/console doctrine:schema:update --force;
  echo "\033[32mLaunching servers:\033[0m";
  php bin/console server:run;
  returnMenu;
}
function wantToexit(){
echo "\033[32m    BYE :* ";
echo "\033[0m";
break
}
function displayHeader(){
  echo "---------------------------------------------------------------------------";
echo "     *                            *                                 *      ";
echo "        ______________                                   *                 ";
echo "       //  __________/       SIMPLE SYMFONY GUI BY                         ";
echo "      //  /____   _________  _________  ___________  ________  __________  ";
echo "     //  _____/  // ____  / //  _____/ //___   ___/ //  ____/ //  ___   /  ";
echo "    //  /       // /   / / //  /___       //  /    //  /___  //  /__/  /   ";
echo "   //  /       // /   / / //___   /      //  /    //  ____/ //    ____/    ";
echo "  //  /       // /___/ / ____//  /      //  /    //  /___  //  /\  \       ";
echo " //__/       //_______/ //_____ /      //__/    //______/ //__/  \__\      ";
echo "    *                                *                         *           ";
echo "                  *                                *                       ";
}
function displayLegal(){
  echo "\033[34mSymfonUI.sh \033[0mis intended to be OpenSource for all your \033[31mSymfony\033[0m needs.";
  echo "Please enjoy using it. Any other use is not the responsibility of the developer.";
  echo ""
}
function displayMenu(){
echo "---------------------------------------------------------------------------";
# PS3='Your choice [n]: '
echo "\033[32mBe sure you re in the path of your Symfony folder.";
echo "\033[0m";
echo "      [0]   \033[34mInstall symfony\033[0m               [1]   Open the console";
echo "      [2]   Start Server                  [3]   Update your schema (+force opt)";
echo "      [4]   See the routes (debug:router) [5]   Create a new Controller";
echo "      [6]   Create a bundle               [7]   Create an entity";
echo "      [8]   Generate a CRUD for entity    [9]   Install project of a friend";
echo "      [10]  EXIT symfonUI.";
read -p "   Your choice [n]: " userDecision;
  if [[ "$userDecision" == "0" ]]; then
      installSymfony;
  elif [[ "$userDecision" == "1" ]]; then
      openConsole;
  elif [[ "$userDecision" == "2" ]]; then
      startServers;
  elif [[ "$userDecision" == "3" ]]; then
      updateSchema;
  elif [[ "$userDecision" == "4" ]]; then
      seeRoutes;
  elif [[ "$userDecision" == "5" ]]; then
      createSFController;
  elif [[ "$userDecision" == "6" ]]; then
      createBundle;
  elif [[ "$userDecision" == "7" ]]; then
      createEntity;
  elif [[ "$userDecision" == "8" ]]; then
      generateSFCRUD;
  elif [[ "$userDecision" == "9" ]]; then
      installProjMate;
  elif [[ "$userDecision" == "10" ]]; then
      wantToexit;
  else
      wantToexit;
  fi
}
displayHeader;
displayLegal;
displayMenu;
