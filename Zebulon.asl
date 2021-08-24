// Zébulon autosplitter by Tenebrosful

state("zebulon4")
{
    /**
    * 0 : Main screen
    * 1-5 : Levels with fruits
    * 6 : End screen
    **/
    int level : "zebulon4.exe", 0x24058
}

init {
    print("[ZEBULON] INIT");
}

startup {
    print("[ZEBULON] STARTUP");
}

start {
    if(old.level == 0 && current.level == 1){
        print("[ZEBULON] START" + " Niveau: " + current.level);
        return true;
    }
}

reset
{
    if(current.level == 0){
        print("[ZEBULON] RESET");
        return true;
    }
}

split {
    // I don't know why but sometimes current level change to -1
    //if(current.level < 0) print("[ZEBULON] Weird value : " + current.level);
    if(current.level != -1 && current.level != old.level){
        print("[ZEBULON] SPLIT" + (current.level == 6 ? " End" : " Niveau: " + current.level));
        return true;
    }
}