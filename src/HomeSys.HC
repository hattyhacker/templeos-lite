//Place this file in /Home and change
//anything you want.

U0 UserStartUp()
{//Run each time a user a spawned
  DocTermNew;
  Type("::/Doc/Start.DD");
  LBts(&Fs->display_flags,DISPLAYf_SHOW);
  WinToTop;
  WinZBufUpdate;

  switch (sys_boot_src.u16[0]) {
    case BOOT_SRC_RAM:
    case BOOT_SRC_HARDDRV:
      
      Dir;
      if (!sys_startup_classic) {
        // TODO - Have 3d StartDoc Typed here or demo!
        WinBorder(OFF);
        WinMax;
        MouseSet(1);
        AutoComplete(OFF);
      }
    break;
    }

}

U0 SrvStartUp()
{//Run each time a srv task is spawned.
  DocTermNew;
  LBts(&Fs->display_flags,DISPLAYf_SHOW);
  WinToTop;
  WinZBufUpdate;
}

U0 StartUpTasks()
{
  CTask *user1;
  user1=User;
  WinToTop(user1);

  "Boot Time:%7.3fs\n",tS;

  if (sys_startup_classic) {
    WinTileVert;
    CTask *user2;
    user2=User;
    WinTileVert;
  }
  else {
    WinTileHorz;
  }

  XTalk(user1,"Cd;#include \"Once\";\n");

  Silent;	//no output to scrn
  ACInit("/*;!*/Bible.TXT*");
  Silent(OFF); //no output to scrn
}

StartUpTasks;

"\n%s V%5.3f\t%D %T\n\n",sys_os_name,sys_os_version,sys_compile_time,sys_compile_time;
