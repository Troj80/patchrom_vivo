.class public Lcom/android/server/ThemeService;
.super Landroid/content/res/IThemeService$Stub;
.source "ThemeService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ThemeService$ThemeData;,
        Lcom/android/server/ThemeService$ThemeWorkerHandler;
    }
.end annotation


# static fields
.field private static final CM_SETUPWIZARD_PACKAGE:Ljava/lang/String; = "com.cyanogenmod.account"

.field private static final GOOGLE_SETUPWIZARD_PACKAGE:Ljava/lang/String; = "com.google.android.setupwizard"

.field private static final MAX_ICON_CACHE_SIZE:J = 0x2000000L

.field private static final PURGED_ICON_CACHE_SIZE:J = 0x1800000L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mClients:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList",
            "<",
            "Landroid/content/res/IThemeChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mHandler:Lcom/android/server/ThemeService$ThemeWorkerHandler;

.field private mIconCacheSize:J

.field private mOldestFilesFirstComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private mPkgName:Ljava/lang/String;

.field private mProgress:I

.field private mWallpaperChangeReceiver:Landroid/content/BroadcastReceiver;

.field private mWallpaperChangedByUs:Z

.field private mWorker:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    const-class v0, Lcom/android/server/ThemeService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 136
    invoke-direct {p0}, Landroid/content/res/IThemeService$Stub;-><init>()V

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/ThemeService;->mWallpaperChangedByUs:Z

    .line 95
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    .line 97
    new-instance v0, Landroid/os/RemoteCallbackList;

    invoke-direct {v0}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v0, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    .line 820
    new-instance v0, Lcom/android/server/ThemeService$1;

    invoke-direct {v0, p0}, Lcom/android/server/ThemeService$1;-><init>(Lcom/android/server/ThemeService;)V

    iput-object v0, p0, Lcom/android/server/ThemeService;->mWallpaperChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 834
    new-instance v0, Lcom/android/server/ThemeService$2;

    invoke-direct {v0, p0}, Lcom/android/server/ThemeService$2;-><init>(Lcom/android/server/ThemeService;)V

    iput-object v0, p0, Lcom/android/server/ThemeService;->mOldestFilesFirstComparator:Ljava/util/Comparator;

    .line 137
    iput-object p1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    .line 138
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ThemeServiceWorker"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/ThemeService;->mWorker:Landroid/os/HandlerThread;

    .line 139
    iget-object v0, p0, Lcom/android/server/ThemeService;->mWorker:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 140
    new-instance v0, Lcom/android/server/ThemeService$ThemeWorkerHandler;

    iget-object v1, p0, Lcom/android/server/ThemeService;->mWorker:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/ThemeService$ThemeWorkerHandler;-><init>(Lcom/android/server/ThemeService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/ThemeService;->mHandler:Lcom/android/server/ThemeService$ThemeWorkerHandler;

    .line 141
    sget-object v0, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v1, "Spawned worker thread"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createThemeDirIfNotExists()V

    .line 145
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createFontDirIfNotExists()V

    .line 146
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createAlarmDirIfNotExists()V

    .line 147
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createNotificationDirIfNotExists()V

    .line 148
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createRingtoneDirIfNotExists()V

    .line 149
    invoke-static {}, Landroid/content/pm/ThemeUtils;->createIconCacheDirIfNotExists()V

    .line 150
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/ThemeService;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/android/server/ThemeService;->doApplyTheme(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/ThemeService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/android/server/ThemeService;->doApplyDefaultTheme()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/ThemeService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/android/server/ThemeService;->mWallpaperChangedByUs:Z

    return v0
.end method

.method static synthetic access$302(Lcom/android/server/ThemeService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    iput-boolean p1, p0, Lcom/android/server/ThemeService;->mWallpaperChangedByUs:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/ThemeService;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/android/server/ThemeService;->updateProvider(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method private applyBootAnimation(Ljava/lang/String;)Z
    .locals 9
    .parameter "themePath"

    .prologue
    .line 792
    const/4 v3, 0x0

    .line 794
    .local v3, success:Z
    :try_start_0
    new-instance v5, Ljava/util/zip/ZipFile;

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 795
    .local v5, zip:Ljava/util/zip/ZipFile;
    const-string v6, "assets/bootanimation/bootanimation.zip"

    invoke-virtual {v5, v6}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    .line 796
    .local v4, ze:Ljava/util/zip/ZipEntry;
    if-eqz v4, :cond_0

    .line 797
    invoke-direct {p0}, Lcom/android/server/ThemeService;->clearBootAnimation()V

    .line 798
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {v5, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 799
    .local v2, is:Ljava/io/BufferedInputStream;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/system/theme"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "bootanimation.zip"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 801
    .local v0, bootAnimationPath:Ljava/lang/String;
    iget-object v6, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v6, v2, v0}, Landroid/content/pm/ThemeUtils;->copyAndScaleBootAnimation(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 802
    const/16 v6, 0x1e4

    const/4 v7, -0x1

    const/4 v8, -0x1

    invoke-static {v0, v6, v7, v8}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 805
    .end local v0           #bootAnimationPath:Ljava/lang/String;
    .end local v2           #is:Ljava/io/BufferedInputStream;
    :cond_0
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 806
    const/4 v3, 0x1

    .line 811
    .end local v4           #ze:Ljava/util/zip/ZipEntry;
    .end local v5           #zip:Ljava/util/zip/ZipFile;
    :goto_0
    return v3

    .line 807
    :catch_0
    move-exception v1

    .line 808
    .local v1, e:Ljava/lang/Exception;
    sget-object v6, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to load boot animation for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private broadcastThemeChange(Ljava/util/List;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 680
    .local p1, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Landroid/content/Intent;

    const-string v3, "org.cyanogenmod.intent.action.THEME_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 681
    .local v2, intent:Landroid/content/Intent;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 682
    .local v0, comp:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "org.cyanogenmod.intent.category."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 684
    .end local v0           #comp:Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    sget-object v4, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v3, v2, v4}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 685
    return-void
.end method

.method private clearBootAnimation()V
    .locals 3

    .prologue
    .line 815
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/system/theme"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "bootanimation.zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 816
    .local v0, anim:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 817
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 818
    :cond_0
    return-void
.end method

.method private createBuilderFrom(Landroid/content/res/Configuration;Ljava/util/List;)Landroid/content/res/CustomTheme$Builder;
    .locals 2
    .parameter "config"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Configuration;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/res/CustomTheme$Builder;"
        }
    .end annotation

    .prologue
    .line 581
    .local p2, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Landroid/content/res/CustomTheme$Builder;

    iget-object v1, p1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    invoke-direct {v0, v1}, Landroid/content/res/CustomTheme$Builder;-><init>(Landroid/content/res/CustomTheme;)V

    .line 583
    .local v0, builder:Landroid/content/res/CustomTheme$Builder;
    const-string v1, "mods_icons"

    invoke-interface {p2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/CustomTheme$Builder;->icons(Ljava/lang/String;)Landroid/content/res/CustomTheme$Builder;

    .line 587
    :cond_0
    const-string v1, "mods_overlays"

    invoke-interface {p2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 588
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/CustomTheme$Builder;->overlay(Ljava/lang/String;)Landroid/content/res/CustomTheme$Builder;

    .line 589
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/CustomTheme$Builder;->systemUi(Ljava/lang/String;)Landroid/content/res/CustomTheme$Builder;

    .line 592
    :cond_1
    const-string v1, "mods_fonts"

    invoke-interface {p2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 593
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/CustomTheme$Builder;->fonts(Ljava/lang/String;)Landroid/content/res/CustomTheme$Builder;

    .line 596
    :cond_2
    return-object v0
.end method

.method private doApplyDefaultTheme()V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 233
    iget-object v7, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 234
    .local v4, resolver:Landroid/content/ContentResolver;
    const-string v7, "default_theme_package"

    invoke-static {v4, v7}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 236
    .local v2, defaultThemePkg:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, "default_theme_applied_on_first_boot"

    invoke-static {v4, v7, v6}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-nez v7, :cond_1

    .line 239
    .local v5, shouldApply:Z
    :goto_0
    if-eqz v5, :cond_0

    .line 240
    const-string v6, "default_theme_components"

    invoke-static {v4, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 243
    .local v1, defaultThemeComponents:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 244
    new-instance v0, Ljava/util/ArrayList;

    const/16 v6, 0x9

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 245
    .local v0, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v6, "mods_fonts"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    const-string v6, "mods_homescreen"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    const-string v6, "mods_alarms"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    const-string v6, "mods_bootanim"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    const-string v6, "mods_icons"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    const-string v6, "mods_lockscreen"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    const-string v6, "mods_notifications"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    const-string v6, "mods_overlays"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    const-string v6, "mods_ringtones"

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    :goto_1
    :try_start_0
    invoke-virtual {p0, v2, v0}, Lcom/android/server/ThemeService;->requestThemeChange(Ljava/lang/String;Ljava/util/List;)V

    .line 260
    const-string v6, "default_theme_applied_on_first_boot"

    const/4 v7, 0x1

    invoke-static {v4, v6, v7}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    .end local v0           #components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v1           #defaultThemeComponents:Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .end local v5           #shouldApply:Z
    :cond_1
    move v5, v6

    .line 236
    goto :goto_0

    .line 255
    .restart local v1       #defaultThemeComponents:Ljava/lang/String;
    .restart local v5       #shouldApply:Z
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    const-string v6, "\\|"

    invoke-virtual {v1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .restart local v0       #components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_1

    .line 262
    :catch_0
    move-exception v3

    .line 263
    .local v3, e:Landroid/os/RemoteException;
    sget-object v6, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v7, "Unable to set default theme"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method private doApplyTheme(Ljava/lang/String;Ljava/util/List;)V
    .locals 5
    .parameter "pkgName"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x1

    .line 159
    monitor-enter p0

    .line 160
    :try_start_0
    iput-object p1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    .line 161
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/server/ThemeService;->mProgress:I

    .line 162
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 165
    :cond_0
    invoke-direct {p0, v4, p1, p2}, Lcom/android/server/ThemeService;->postFinish(ZLjava/lang/String;Ljava/util/List;)V

    .line 230
    :goto_0
    return-void

    .line 162
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 169
    :cond_1
    const/4 v2, 0x5

    invoke-direct {p0, v2, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 172
    const/16 v2, 0x4b

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    div-int v1, v2, v3

    .line 174
    .local v1, progressIncrement:I
    iget-object v2, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-direct {p0, p2, v2}, Lcom/android/server/ThemeService;->updateProvider(Ljava/util/List;Ljava/lang/String;)V

    .line 176
    const-string v2, "mods_icons"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 177
    invoke-direct {p0}, Lcom/android/server/ThemeService;->updateIcons()V

    .line 178
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 181
    :cond_2
    const-string v2, "mods_homescreen"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 182
    invoke-direct {p0}, Lcom/android/server/ThemeService;->updateWallpaper()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 183
    iput-boolean v4, p0, Lcom/android/server/ThemeService;->mWallpaperChangedByUs:Z

    .line 185
    :cond_3
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 188
    :cond_4
    const-string v2, "mods_lockscreen"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 189
    invoke-direct {p0}, Lcom/android/server/ThemeService;->updateLockscreen()Z

    .line 190
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 193
    :cond_5
    const/4 v0, 0x0

    .line 195
    .local v0, pi:Landroid/content/pm/PackageInfo;
    :try_start_2
    const-string v2, "holo"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 196
    iget-object v2, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v0

    .line 200
    :cond_6
    :goto_1
    const-string v2, "mods_notifications"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 201
    invoke-direct {p0, v0}, Lcom/android/server/ThemeService;->updateNotifications(Landroid/content/pm/PackageInfo;)Z

    .line 202
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 205
    :cond_7
    const-string v2, "mods_alarms"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 206
    invoke-direct {p0, v0}, Lcom/android/server/ThemeService;->updateAlarms(Landroid/content/pm/PackageInfo;)Z

    .line 207
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 210
    :cond_8
    const-string v2, "mods_ringtones"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 211
    invoke-direct {p0, v0}, Lcom/android/server/ThemeService;->updateRingtones(Landroid/content/pm/PackageInfo;)Z

    .line 212
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 215
    :cond_9
    const-string v2, "mods_bootanim"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 216
    invoke-direct {p0}, Lcom/android/server/ThemeService;->updateBootAnim()V

    .line 217
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 220
    :cond_a
    const-string v2, "mods_fonts"

    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 221
    invoke-direct {p0}, Lcom/android/server/ThemeService;->updateFonts()Z

    .line 222
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->incrementProgress(ILjava/lang/String;)V

    .line 225
    :cond_b
    invoke-direct {p0, p2}, Lcom/android/server/ThemeService;->updateConfiguration(Ljava/util/List;)Z

    .line 227
    invoke-direct {p0}, Lcom/android/server/ThemeService;->killLaunchers()V

    .line 229
    invoke-direct {p0, v4, p1, p2}, Lcom/android/server/ThemeService;->postFinish(ZLjava/lang/String;Ljava/util/List;)V

    goto/16 :goto_0

    .line 197
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method private handlesThemeChanges(Ljava/lang/String;Ljava/util/List;)Z
    .locals 3
    .parameter "pkgName"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 633
    .local p2, infos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 634
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 635
    .local v1, info:Landroid/content/pm/ResolveInfo;
    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 636
    const/4 v2, 0x1

    .line 640
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #info:Landroid/content/pm/ResolveInfo;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private incrementProgress(ILjava/lang/String;)V
    .locals 2
    .parameter "increment"
    .parameter "pkgName"

    .prologue
    const/16 v1, 0x64

    .line 688
    monitor-enter p0

    .line 689
    :try_start_0
    iget v0, p0, Lcom/android/server/ThemeService;->mProgress:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/server/ThemeService;->mProgress:I

    .line 690
    iget v0, p0, Lcom/android/server/ThemeService;->mProgress:I

    if-le v0, v1, :cond_0

    const/16 v0, 0x64

    iput v0, p0, Lcom/android/server/ThemeService;->mProgress:I

    .line 691
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 692
    invoke-direct {p0, p2}, Lcom/android/server/ThemeService;->postProgress(Ljava/lang/String;)V

    .line 693
    return-void

    .line 691
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private isSetupActivity(Landroid/content/pm/ResolveInfo;)Z
    .locals 2
    .parameter "info"

    .prologue
    .line 628
    const-string v0, "com.google.android.setupwizard"

    iget-object v1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "com.cyanogenmod.account"

    iget-object v1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private killLaunchers()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 602
    iget-object v9, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v10, "activity"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 603
    .local v0, am:Landroid/app/ActivityManager;
    iget-object v9, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 605
    .local v7, pm:Landroid/content/pm/PackageManager;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 606
    .local v2, homeIntent:Landroid/content/Intent;
    const-string v9, "android.intent.action.MAIN"

    invoke-virtual {v2, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 607
    const-string v9, "android.intent.category.HOME"

    invoke-virtual {v2, v9}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 609
    invoke-virtual {v7, v2, v11}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 610
    .local v5, infos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    new-instance v9, Landroid/content/Intent;

    const-string v10, "org.cyanogenmod.intent.action.THEME_CHANGED"

    invoke-direct {v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9, v11}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v8

    .line 612
    .local v8, themeChangeInfos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 613
    .local v4, info:Landroid/content/pm/ResolveInfo;
    iget-object v9, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v9, :cond_0

    iget-object v9, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v9, :cond_0

    invoke-direct {p0, v4}, Lcom/android/server/ThemeService;->isSetupActivity(Landroid/content/pm/ResolveInfo;)Z

    move-result v9

    if-nez v9, :cond_0

    iget-object v9, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v9, v8}, Lcom/android/server/ThemeService;->handlesThemeChanges(Ljava/lang/String;Ljava/util/List;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 616
    iget-object v9, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v9, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 617
    .local v6, pkgToStop:Ljava/lang/String;
    sget-object v9, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Force stopping "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " for theme change"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    :try_start_0
    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->forceStopPackage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 620
    :catch_0
    move-exception v1

    .line 621
    .local v1, e:Ljava/lang/Exception;
    sget-object v9, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v10, "Unable to force stop package, did you forget platform signature?"

    invoke-static {v9, v10, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 625
    .end local v1           #e:Ljava/lang/Exception;
    .end local v4           #info:Landroid/content/pm/ResolveInfo;
    .end local v6           #pkgToStop:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private postFinish(ZLjava/lang/String;Ljava/util/List;)V
    .locals 7
    .parameter "isSuccess"
    .parameter "pkgName"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 657
    monitor-enter p0

    .line 658
    const/4 v4, 0x0

    :try_start_0
    iput v4, p0, Lcom/android/server/ThemeService;->mProgress:I

    .line 659
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    .line 660
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 662
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v4}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v0

    .line 663
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 664
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v4, v6}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v3

    check-cast v3, Landroid/content/res/IThemeChangeListener;

    .line 666
    .local v3, listener:Landroid/content/res/IThemeChangeListener;
    :try_start_1
    invoke-interface {v3, p1, p2}, Landroid/content/res/IThemeChangeListener;->onFinish(ZLjava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 663
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 660
    .end local v0           #N:I
    .end local v2           #i:I
    .end local v3           #listener:Landroid/content/res/IThemeChangeListener;
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 667
    .restart local v0       #N:I
    .restart local v2       #i:I
    .restart local v3       #listener:Landroid/content/res/IThemeChangeListener;
    :catch_0
    move-exception v1

    .line 668
    .local v1, e:Landroid/os/RemoteException;
    sget-object v4, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v5, "Unable to post progress to client listener"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 671
    .end local v1           #e:Landroid/os/RemoteException;
    .end local v3           #listener:Landroid/content/res/IThemeChangeListener;
    :cond_0
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v4}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 674
    if-eqz p1, :cond_1

    .line 675
    invoke-direct {p0, p3}, Lcom/android/server/ThemeService;->broadcastThemeChange(Ljava/util/List;)V

    .line 677
    :cond_1
    return-void
.end method

.method private postProgress(Ljava/lang/String;)V
    .locals 6
    .parameter "pkgName"

    .prologue
    .line 644
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v4}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v0

    .line 645
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 646
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v3

    check-cast v3, Landroid/content/res/IThemeChangeListener;

    .line 648
    .local v3, listener:Landroid/content/res/IThemeChangeListener;
    :try_start_0
    iget v4, p0, Lcom/android/server/ThemeService;->mProgress:I

    invoke-interface {v3, v4, p1}, Landroid/content/res/IThemeChangeListener;->onProgress(ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 645
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 649
    :catch_0
    move-exception v1

    .line 650
    .local v1, e:Landroid/os/RemoteException;
    sget-object v4, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v5, "Unable to post progress to client listener"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 653
    .end local v1           #e:Landroid/os/RemoteException;
    .end local v3           #listener:Landroid/content/res/IThemeChangeListener;
    :cond_0
    iget-object v4, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v4}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    .line 654
    return-void
.end method

.method private purgeIconCache()V
    .locals 12

    .prologue
    .line 778
    sget-object v8, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Purging icon cahe of size "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    new-instance v1, Ljava/io/File;

    sget-object v8, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_ICON_CACHE_DIR:Ljava/lang/String;

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 780
    .local v1, cacheDir:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 781
    .local v3, files:[Ljava/io/File;
    iget-object v8, p0, Lcom/android/server/ThemeService;->mOldestFilesFirstComparator:Ljava/util/Comparator;

    invoke-static {v3, v8}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 782
    move-object v0, v3

    .local v0, arr$:[Ljava/io/File;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v0, v4

    .line 783
    .local v2, f:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_0

    .line 784
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 785
    .local v6, size:J
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v8

    if-eqz v8, :cond_0

    iget-wide v8, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    sub-long/2addr v8, v6

    iput-wide v8, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    .line 787
    .end local v6           #size:J
    :cond_0
    iget-wide v8, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    const-wide/32 v10, 0x1800000

    cmp-long v8, v8, v10

    if-gtz v8, :cond_2

    .line 789
    .end local v2           #f:Ljava/io/File;
    :cond_1
    return-void

    .line 782
    .restart local v2       #f:Ljava/io/File;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method private setCustomLockScreenWallpaper()Z
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 485
    :try_start_0
    iget-object v6, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v7, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v8, 0x2

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v3

    .line 486
    .local v3, themeCtx:Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 487
    .local v0, assetManager:Landroid/content/res/AssetManager;
    invoke-static {v0}, Landroid/content/pm/ThemeUtils;->getLockscreenWallpaperPath(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v4

    .line 488
    .local v4, wpPath:Ljava/lang/String;
    if-nez v4, :cond_0

    .line 489
    sget-object v6, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v7, "Not setting lockscreen wp because wallpaper file was not found."

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    .end local v0           #assetManager:Landroid/content/res/AssetManager;
    .end local v3           #themeCtx:Landroid/content/Context;
    .end local v4           #wpPath:Ljava/lang/String;
    :goto_0
    return v5

    .line 492
    .restart local v0       #assetManager:Landroid/content/res/AssetManager;
    .restart local v3       #themeCtx:Landroid/content/Context;
    .restart local v4       #wpPath:Ljava/lang/String;
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "file:///android_asset/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 494
    .local v2, is:Ljava/io/InputStream;
    iget-object v6, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/app/WallpaperManager;->setKeyguardStream(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    const/4 v5, 0x1

    goto :goto_0

    .line 495
    .end local v0           #assetManager:Landroid/content/res/AssetManager;
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #themeCtx:Landroid/content/Context;
    .end local v4           #wpPath:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 496
    .local v1, e:Ljava/lang/Exception;
    sget-object v6, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "There was an error setting lockscreen wp for pkg "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private updateAlarms(Landroid/content/pm/PackageInfo;)Z
    .locals 3
    .parameter "pi"

    .prologue
    .line 351
    sget-object v0, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_ALARM_PATH:Ljava/lang/String;

    const-string v1, "alarms"

    const/4 v2, 0x4

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/android/server/ThemeService;->updateAudible(Ljava/lang/String;Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z

    move-result v0

    return v0
.end method

.method private updateAudible(Ljava/lang/String;Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z
    .locals 11
    .parameter "dirPath"
    .parameter "assetPath"
    .parameter "type"
    .parameter "pi"

    .prologue
    .line 367
    iget-object v8, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v8, p1}, Landroid/content/pm/ThemeUtils;->clearAudibles(Landroid/content/Context;Ljava/lang/String;)V

    .line 368
    iget-object v8, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const-string v9, "holo"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 369
    iget-object v8, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v8, p3}, Landroid/content/pm/ThemeUtils;->setDefaultAudible(Landroid/content/Context;I)Z

    move-result v8

    if-nez v8, :cond_0

    .line 370
    sget-object v8, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v9, "There was an error installing the default audio file"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    const/4 v8, 0x0

    .line 417
    :goto_0
    return v8

    .line 373
    :cond_0
    const/4 v8, 0x1

    goto :goto_0

    .line 376
    :cond_1
    if-eqz p4, :cond_2

    iget-boolean v8, p4, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v8, :cond_2

    .line 377
    invoke-direct {p0, p1, p3, p4}, Lcom/android/server/ThemeService;->updateLegacyAudible(Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z

    move-result v8

    goto :goto_0

    .line 384
    :cond_2
    :try_start_0
    iget-object v8, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v9, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v10, 0x2

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v7

    .line 385
    .local v7, themeCtx:Landroid/content/Context;
    invoke-virtual {v7}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 386
    .local v2, assetManager:Landroid/content/res/AssetManager;
    invoke-virtual {v2, p2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 391
    .local v1, assetList:[Ljava/lang/String;
    if-eqz v1, :cond_3

    array-length v8, v1

    if-nez v8, :cond_4

    .line 392
    :cond_3
    sget-object v8, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v9, "Could not find any audio assets"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    const/4 v8, 0x0

    goto :goto_0

    .line 387
    .end local v1           #assetList:[Ljava/lang/String;
    .end local v2           #assetManager:Landroid/content/res/AssetManager;
    .end local v7           #themeCtx:Landroid/content/Context;
    :catch_0
    move-exception v3

    .line 388
    .local v3, e:Ljava/lang/Exception;
    sget-object v8, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "There was an error getting assets for pkg "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 389
    const/4 v8, 0x0

    goto :goto_0

    .line 398
    .end local v3           #e:Ljava/lang/Exception;
    .restart local v1       #assetList:[Ljava/lang/String;
    .restart local v2       #assetManager:Landroid/content/res/AssetManager;
    .restart local v7       #themeCtx:Landroid/content/Context;
    :cond_4
    const/4 v8, 0x0

    aget-object v0, v1, v8

    .line 399
    .local v0, asset:Ljava/lang/String;
    invoke-static {v0}, Landroid/content/pm/ThemeUtils;->isValidAudible(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    const/4 v8, 0x0

    goto :goto_0

    .line 401
    :cond_5
    const/4 v4, 0x0

    .line 402
    .local v4, is:Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 404
    .local v5, os:Ljava/io/OutputStream;
    :try_start_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "file:///android_asset/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 406
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .local v6, outFile:Ljava/io/File;
    invoke-static {v4, v6}, Landroid/os/FileUtils;->copyToFile(Ljava/io/InputStream;Ljava/io/File;)Z

    .line 408
    const/16 v8, 0x1e7

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-static {v6, v8, v9, v10}, Landroid/os/FileUtils;->setPermissions(Ljava/io/File;III)I

    .line 409
    iget-object v8, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v9, p4, Landroid/content/pm/PackageInfo;->themeInfos:[Landroid/content/pm/ThemeInfo;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    iget-object v9, v9, Landroid/content/pm/ThemeInfo;->name:Ljava/lang/String;

    invoke-static {v8, v6, p3, v9}, Landroid/content/pm/ThemeUtils;->setAudible(Landroid/content/Context;Ljava/io/File;ILjava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 414
    invoke-static {v4}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 415
    invoke-static {v5}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 417
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 410
    .end local v6           #outFile:Ljava/io/File;
    :catch_1
    move-exception v3

    .line 411
    .restart local v3       #e:Ljava/lang/Exception;
    :try_start_2
    sget-object v8, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "There was an error installing the new audio file for pkg "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 412
    const/4 v8, 0x0

    .line 414
    invoke-static {v4}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 415
    invoke-static {v5}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    goto/16 :goto_0

    .line 414
    .end local v3           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    invoke-static {v4}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 415
    invoke-static {v5}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 414
    throw v8
.end method

.method private updateBootAnim()V
    .locals 5

    .prologue
    .line 338
    invoke-direct {p0}, Lcom/android/server/ThemeService;->clearBootAnimation()V

    .line 339
    const-string v3, "holo"

    iget-object v4, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 348
    :goto_0
    return-void

    .line 341
    :cond_0
    iget-object v3, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 343
    .local v2, pm:Landroid/content/pm/PackageManager;
    :try_start_0
    iget-object v3, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 344
    .local v0, ai:Landroid/content/pm/ApplicationInfo;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/android/server/ThemeService;->applyBootAnimation(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 345
    .end local v0           #ai:Landroid/content/pm/ApplicationInfo;
    :catch_0
    move-exception v1

    .line 346
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v3, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v4, "Changing boot animation failed"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private updateConfiguration(Ljava/util/List;)Z
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 563
    .local p1, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    .line 564
    .local v0, am:Landroid/app/IActivityManager;
    if-eqz v0, :cond_0

    .line 565
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v4

    .line 567
    .local v4, token:J
    :try_start_0
    invoke-interface {v0}, Landroid/app/IActivityManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 568
    .local v1, config:Landroid/content/res/Configuration;
    invoke-direct {p0, v1, p1}, Lcom/android/server/ThemeService;->createBuilderFrom(Landroid/content/res/Configuration;Ljava/util/List;)Landroid/content/res/CustomTheme$Builder;

    move-result-object v3

    .line 569
    .local v3, themeBuilder:Landroid/content/res/CustomTheme$Builder;
    invoke-virtual {v3}, Landroid/content/res/CustomTheme$Builder;->build()Landroid/content/res/CustomTheme;

    move-result-object v6

    iput-object v6, v1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    .line 570
    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 574
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 577
    .end local v1           #config:Landroid/content/res/Configuration;
    .end local v3           #themeBuilder:Landroid/content/res/CustomTheme$Builder;
    .end local v4           #token:J
    :cond_0
    const/4 v6, 0x1

    :goto_0
    return v6

    .line 571
    .restart local v4       #token:J
    :catch_0
    move-exception v2

    .line 572
    .local v2, e:Landroid/os/RemoteException;
    const/4 v6, 0x0

    .line 574
    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_0

    .end local v2           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v6

    invoke-static {v4, v5}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v6
.end method

.method private updateFonts()Z
    .locals 15

    .prologue
    const/4 v11, 0x0

    .line 294
    sget-object v12, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_FONT_PATH:Ljava/lang/String;

    invoke-static {v12}, Landroid/content/pm/ThemeUtils;->deleteFilesInDir(Ljava/lang/String;)V

    .line 296
    iget-object v12, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const-string v13, "holo"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 301
    :try_start_0
    iget-object v12, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v13, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v14, 0x2

    invoke-virtual {v12, v13, v14}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v10

    .line 302
    .local v10, themeCtx:Landroid/content/Context;
    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    .line 303
    .local v3, assetManager:Landroid/content/res/AssetManager;
    const-string v12, "fonts"

    invoke-virtual {v3, v12}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 308
    .local v2, assetList:[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v12, v2

    if-nez v12, :cond_1

    .line 309
    :cond_0
    sget-object v12, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v13, "Could not find any font assets"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    .end local v2           #assetList:[Ljava/lang/String;
    .end local v3           #assetManager:Landroid/content/res/AssetManager;
    .end local v10           #themeCtx:Landroid/content/Context;
    :goto_0
    return v11

    .line 304
    :catch_0
    move-exception v4

    .line 305
    .local v4, e:Ljava/lang/Exception;
    sget-object v12, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "There was an error getting assets  for pkg "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 314
    .end local v4           #e:Ljava/lang/Exception;
    .restart local v2       #assetList:[Ljava/lang/String;
    .restart local v3       #assetManager:Landroid/content/res/AssetManager;
    .restart local v10       #themeCtx:Landroid/content/Context;
    :cond_1
    move-object v0, v2

    .local v0, arr$:[Ljava/lang/String;
    array-length v7, v0

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v7, :cond_2

    aget-object v1, v0, v5

    .line 315
    .local v1, asset:Ljava/lang/String;
    const/4 v6, 0x0

    .line 316
    .local v6, is:Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 318
    .local v8, os:Ljava/io/OutputStream;
    :try_start_1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "file:///android_asset/fonts/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 319
    new-instance v9, Ljava/io/File;

    sget-object v12, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_FONT_PATH:Ljava/lang/String;

    invoke-direct {v9, v12, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .local v9, outFile:Ljava/io/File;
    invoke-static {v6, v9}, Landroid/os/FileUtils;->copyToFile(Ljava/io/InputStream;Ljava/io/File;)Z

    .line 321
    const/16 v12, 0x1e7

    const/4 v13, -0x1

    const/4 v14, -0x1

    invoke-static {v9, v12, v13, v14}, Landroid/os/FileUtils;->setPermissions(Ljava/io/File;III)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 326
    invoke-static {v6}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 327
    invoke-static {v8}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 314
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 322
    .end local v9           #outFile:Ljava/io/File;
    :catch_1
    move-exception v4

    .line 323
    .restart local v4       #e:Ljava/lang/Exception;
    :try_start_2
    sget-object v12, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "There was an error installing the new fonts for pkg "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 326
    invoke-static {v6}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 327
    invoke-static {v8}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 326
    .end local v4           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    invoke-static {v6}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 327
    invoke-static {v8}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 326
    throw v11

    .line 333
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #asset:Ljava/lang/String;
    .end local v2           #assetList:[Ljava/lang/String;
    .end local v3           #assetManager:Landroid/content/res/AssetManager;
    .end local v5           #i$:I
    .end local v6           #is:Ljava/io/InputStream;
    .end local v7           #len$:I
    .end local v8           #os:Ljava/io/OutputStream;
    .end local v10           #themeCtx:Landroid/content/Context;
    :cond_2
    const-string v11, "sys.refresh_theme"

    const-string v12, "1"

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const/4 v11, 0x1

    goto/16 :goto_0
.end method

.method private updateIcons()V
    .locals 3

    .prologue
    .line 284
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 285
    .local v0, pm:Landroid/content/pm/PackageManager;
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const-string v2, "holo"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->updateIconMaps(Ljava/lang/String;)V

    .line 290
    :goto_0
    return-void

    .line 288
    :cond_0
    iget-object v1, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->updateIconMaps(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private updateLegacyAudible(Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z
    .locals 10
    .parameter "dirPath"
    .parameter "type"
    .parameter "pi"

    .prologue
    const/4 v6, 0x0

    .line 421
    iget-object v7, p3, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    if-eqz v7, :cond_0

    iget-object v7, p3, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    array-length v7, v7

    if-nez v7, :cond_1

    .line 463
    :cond_0
    :goto_0
    return v6

    .line 427
    :cond_1
    :try_start_0
    iget-object v7, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v8, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v9, 0x2

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 436
    .local v5, themeCtx:Landroid/content/Context;
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 441
    :pswitch_0
    iget-object v7, p3, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    aget-object v7, v7, v6

    iget-object v0, v7, Landroid/content/pm/LegacyThemeInfo;->ringtoneFileName:Ljava/lang/String;

    .line 446
    .local v0, asset:Ljava/lang/String;
    :goto_1
    invoke-static {v0}, Landroid/content/pm/ThemeUtils;->isValidAudible(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 448
    const/4 v2, 0x0

    .line 449
    .local v2, is:Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 451
    .local v3, os:Ljava/io/OutputStream;
    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "file:///android_asset/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 452
    new-instance v4, Ljava/io/File;

    const/16 v7, 0x2f

    invoke-virtual {v0, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, p1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    .local v4, outFile:Ljava/io/File;
    invoke-static {v2, v4}, Landroid/os/FileUtils;->copyToFile(Ljava/io/InputStream;Ljava/io/File;)Z

    .line 454
    const/16 v7, 0x1e7

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-static {v4, v7, v8, v9}, Landroid/os/FileUtils;->setPermissions(Ljava/io/File;III)I

    .line 455
    iget-object v7, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v8, p3, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    const/4 v9, 0x0

    aget-object v8, v8, v9

    iget-object v8, v8, Landroid/content/pm/LegacyThemeInfo;->name:Ljava/lang/String;

    invoke-static {v7, v4, p2, v8}, Landroid/content/pm/ThemeUtils;->setAudible(Landroid/content/Context;Ljava/io/File;ILjava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 460
    invoke-static {v2}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 461
    invoke-static {v3}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 463
    const/4 v6, 0x1

    goto :goto_0

    .line 428
    .end local v0           #asset:Ljava/lang/String;
    .end local v2           #is:Ljava/io/InputStream;
    .end local v3           #os:Ljava/io/OutputStream;
    .end local v4           #outFile:Ljava/io/File;
    .end local v5           #themeCtx:Landroid/content/Context;
    :catch_0
    move-exception v1

    .line 429
    .local v1, e:Ljava/lang/Exception;
    sget-object v7, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "There was an error getting assets for pkg "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 438
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v5       #themeCtx:Landroid/content/Context;
    :pswitch_1
    iget-object v7, p3, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    aget-object v7, v7, v6

    iget-object v0, v7, Landroid/content/pm/LegacyThemeInfo;->notificationFileName:Ljava/lang/String;

    .line 439
    .restart local v0       #asset:Ljava/lang/String;
    goto :goto_1

    .line 456
    .restart local v2       #is:Ljava/io/InputStream;
    .restart local v3       #os:Ljava/io/OutputStream;
    :catch_1
    move-exception v1

    .line 457
    .restart local v1       #e:Ljava/lang/Exception;
    :try_start_2
    sget-object v7, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "There was an error installing the new audio file for pkg "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 460
    invoke-static {v2}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 461
    invoke-static {v3}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    goto/16 :goto_0

    .line 460
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    invoke-static {v2}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 461
    invoke-static {v3}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 460
    throw v6

    .line 436
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private updateLockscreen()Z
    .locals 4

    .prologue
    .line 467
    const/4 v0, 0x0

    .line 468
    .local v0, success:Z
    const-string v1, "holo"

    iget-object v2, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 469
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/WallpaperManager;->clearKeyguardWallpaper()V

    .line 470
    const/4 v0, 0x1

    .line 475
    :goto_0
    if-eqz v0, :cond_0

    .line 476
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.KEYGUARD_WALLPAPER_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 479
    :cond_0
    return v0

    .line 472
    :cond_1
    invoke-direct {p0}, Lcom/android/server/ThemeService;->setCustomLockScreenWallpaper()Z

    move-result v0

    goto :goto_0
.end method

.method private updateNotifications(Landroid/content/pm/PackageInfo;)Z
    .locals 3
    .parameter "pi"

    .prologue
    .line 356
    sget-object v0, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_NOTIFICATION_PATH:Ljava/lang/String;

    const-string v1, "notifications"

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/android/server/ThemeService;->updateAudible(Ljava/lang/String;Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z

    move-result v0

    return v0
.end method

.method private updateProvider(Ljava/util/List;Ljava/lang/String;)V
    .locals 8
    .parameter
    .parameter "pkgName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 269
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 270
    .local v3, values:Landroid/content/ContentValues;
    const-string v5, "value"

    invoke-virtual {v3, v5, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 273
    .local v0, component:Ljava/lang/String;
    const-string v4, "key=?"

    .line 274
    .local v4, where:Ljava/lang/String;
    const/4 v5, 0x1

    new-array v2, v5, [Ljava/lang/String;

    invoke-static {v0}, Landroid/provider/ThemesContract$MixnMatchColumns;->componentToMixNMatchKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v7

    .line 275
    .local v2, selectionArgs:[Ljava/lang/String;
    aget-object v5, v2, v7

    if-eqz v5, :cond_0

    .line 278
    iget-object v5, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/ThemesContract$MixnMatchColumns;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v3, v4, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 281
    .end local v0           #component:Ljava/lang/String;
    .end local v2           #selectionArgs:[Ljava/lang/String;
    .end local v4           #where:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private updateRingtones(Landroid/content/pm/PackageInfo;)Z
    .locals 3
    .parameter "pi"

    .prologue
    .line 361
    sget-object v0, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_RINGTONE_PATH:Ljava/lang/String;

    const-string v1, "ringtones"

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/android/server/ThemeService;->updateAudible(Ljava/lang/String;Ljava/lang/String;ILandroid/content/pm/PackageInfo;)Z

    move-result v0

    return v0
.end method

.method private updateWallpaper()Z
    .locals 18

    .prologue
    .line 503
    const-string v4, "pkg_name= ?"

    .line 504
    .local v4, selection:Ljava/lang/String;
    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    aput-object v2, v5, v1

    .line 505
    .local v5, selectionArgs:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ThemesContract$MixnMatchColumns;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 507
    .local v8, c:Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 509
    const-string v1, "holo"

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 511
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/WallpaperManager;->clear()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 559
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 512
    :catch_0
    move-exception v9

    .line 513
    .local v9, e:Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_1

    .line 516
    .end local v9           #e:Ljava/io/IOException;
    :cond_0
    const/4 v10, 0x0

    .line 518
    .local v10, in:Ljava/io/InputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v14

    .line 519
    .local v14, themeContext:Landroid/content/Context;
    const-string v1, "is_legacy_theme"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/4 v11, 0x1

    .line 521
    .local v11, isLegacyTheme:Z
    :goto_2
    if-nez v11, :cond_5

    .line 522
    const-string v1, "wallpaper_uri"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 523
    .local v16, wallpaper:Ljava/lang/String;
    if-eqz v16, :cond_3

    .line 524
    invoke-static/range {v16 .. v16}, Landroid/webkit/URLUtil;->isAssetUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 525
    move-object/from16 v0, v16

    invoke-static {v14, v0}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v10

    .line 542
    :goto_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/app/WallpaperManager;->setStream(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 556
    .end local v16           #wallpaper:Ljava/lang/String;
    :goto_4
    invoke-static {v10}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_0

    .line 519
    .end local v11           #isLegacyTheme:Z
    :cond_1
    const/4 v11, 0x0

    goto :goto_2

    .line 527
    .restart local v11       #isLegacyTheme:Z
    .restart local v16       #wallpaper:Ljava/lang/String;
    :cond_2
    :try_start_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static/range {v16 .. v16}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v10

    goto :goto_3

    .line 531
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v15

    .line 533
    .local v15, themeCtx:Landroid/content/Context;
    invoke-virtual {v15}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    .line 534
    .local v7, assetManager:Landroid/content/res/AssetManager;
    invoke-static {v7}, Landroid/content/pm/ThemeUtils;->getWallpaperPath(Landroid/content/res/AssetManager;)Ljava/lang/String;

    move-result-object v17

    .line 535
    .local v17, wpPath:Ljava/lang/String;
    if-nez v17, :cond_4

    .line 536
    sget-object v1, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    const-string v2, "Not setting wp because wallpaper file was not found."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 537
    const/4 v1, 0x0

    .line 556
    .end local v7           #assetManager:Landroid/content/res/AssetManager;
    .end local v11           #isLegacyTheme:Z
    .end local v14           #themeContext:Landroid/content/Context;
    .end local v15           #themeCtx:Landroid/content/Context;
    .end local v16           #wallpaper:Ljava/lang/String;
    .end local v17           #wpPath:Ljava/lang/String;
    :goto_5
    invoke-static {v10}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_1

    .line 539
    .restart local v7       #assetManager:Landroid/content/res/AssetManager;
    .restart local v11       #isLegacyTheme:Z
    .restart local v14       #themeContext:Landroid/content/Context;
    .restart local v15       #themeCtx:Landroid/content/Context;
    .restart local v16       #wallpaper:Ljava/lang/String;
    .restart local v17       #wpPath:Ljava/lang/String;
    :cond_4
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v15, v1}, Landroid/content/pm/ThemeUtils;->getInputStreamFromAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v10

    goto :goto_3

    .line 544
    .end local v7           #assetManager:Landroid/content/res/AssetManager;
    .end local v15           #themeCtx:Landroid/content/Context;
    .end local v16           #wallpaper:Ljava/lang/String;
    .end local v17           #wpPath:Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 545
    .local v13, pm:Landroid/content/pm/PackageManager;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v13, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    .line 546
    .local v12, pi:Landroid/content/pm/PackageInfo;
    iget-object v1, v12, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    if-eqz v1, :cond_6

    iget-object v1, v12, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    array-length v1, v1

    if-lez v1, :cond_6

    .line 547
    invoke-static {v14}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    iget-object v2, v12, Landroid/content/pm/PackageInfo;->legacyThemeInfos:[Landroid/content/pm/LegacyThemeInfo;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget v2, v2, Landroid/content/pm/LegacyThemeInfo;->wallpaperResourceId:I

    invoke-virtual {v1, v2}, Landroid/app/WallpaperManager;->setResource(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    .line 553
    .end local v11           #isLegacyTheme:Z
    .end local v12           #pi:Landroid/content/pm/PackageInfo;
    .end local v13           #pm:Landroid/content/pm/PackageManager;
    .end local v14           #themeContext:Landroid/content/Context;
    :catch_1
    move-exception v9

    .line 554
    .local v9, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_5

    .line 550
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v11       #isLegacyTheme:Z
    .restart local v12       #pi:Landroid/content/pm/PackageInfo;
    .restart local v13       #pm:Landroid/content/pm/PackageManager;
    .restart local v14       #themeContext:Landroid/content/Context;
    :cond_6
    const/4 v1, 0x0

    goto :goto_5

    .line 556
    .end local v11           #isLegacyTheme:Z
    .end local v12           #pi:Landroid/content/pm/PackageInfo;
    .end local v13           #pm:Landroid/content/pm/PackageManager;
    .end local v14           #themeContext:Landroid/content/Context;
    :catchall_0
    move-exception v1

    invoke-static {v10}, Landroid/content/pm/ThemeUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method


# virtual methods
.method public applyDefaultTheme()V
    .locals 4

    .prologue
    .line 721
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 724
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 725
    iget-object v1, p0, Lcom/android/server/ThemeService;->mHandler:Lcom/android/server/ThemeService$ThemeWorkerHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/ThemeService$ThemeWorkerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 726
    return-void
.end method

.method public cacheComposedIcon(Landroid/graphics/Bitmap;Ljava/lang/String;)Z
    .locals 11
    .parameter "icon"
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 749
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v5

    .line 752
    .local v5, token:J
    new-instance v0, Ljava/io/File;

    sget-object v7, Landroid/content/pm/ThemeUtils;->SYSTEM_THEME_ICON_CACHE_DIR:Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 753
    .local v0, cacheDir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    array-length v7, v7

    if-nez v7, :cond_0

    .line 754
    const-wide/16 v7, 0x0

    iput-wide v7, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    .line 757
    :cond_0
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 758
    .local v3, outFile:Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 759
    .local v2, os:Ljava/io/FileOutputStream;
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x5a

    invoke-virtual {p1, v7, v8, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 760
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 761
    const/16 v7, 0x1fc

    const/4 v8, -0x1

    const/4 v9, -0x1

    invoke-static {v3, v7, v8, v9}, Landroid/os/FileUtils;->setPermissions(Ljava/io/File;III)I

    .line 764
    iget-wide v7, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v9

    add-long/2addr v7, v9

    iput-wide v7, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    .line 765
    iget-wide v7, p0, Lcom/android/server/ThemeService;->mIconCacheSize:J

    const-wide/32 v9, 0x2000000

    cmp-long v7, v7, v9

    if-lez v7, :cond_1

    .line 766
    invoke-direct {p0}, Lcom/android/server/ThemeService;->purgeIconCache()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 768
    :cond_1
    const/4 v4, 0x1

    .line 773
    .end local v2           #os:Ljava/io/FileOutputStream;
    .end local v3           #outFile:Ljava/io/File;
    .local v4, success:Z
    :goto_0
    invoke-static {v5, v6}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 774
    return v4

    .line 769
    .end local v4           #success:Z
    :catch_0
    move-exception v1

    .line 770
    .local v1, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    .line 771
    .restart local v4       #success:Z
    sget-object v7, Lcom/android/server/ThemeService;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to cache icon "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public getProgress(Ljava/lang/String;)I
    .locals 3
    .parameter "pkgName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 740
    iget-object v0, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    monitor-enter p0

    .line 743
    :try_start_0
    iget v0, p0, Lcom/android/server/ThemeService;->mProgress:I

    monitor-exit p0

    return v0

    .line 744
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isThemeApplying(Ljava/lang/String;)Z
    .locals 3
    .parameter "pkgName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 730
    iget-object v0, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    if-nez p1, :cond_0

    .line 733
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Package name is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 735
    :cond_0
    iget-object v0, p0, Lcom/android/server/ThemeService;->mPkgName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeUpdates(Landroid/content/res/IThemeChangeListener;)V
    .locals 3
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 704
    iget-object v0, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 706
    iget-object v0, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z

    .line 707
    return-void
.end method

.method public requestThemeChange(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .parameter "pkgName"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 711
    .local p2, components:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 714
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 715
    new-instance v1, Lcom/android/server/ThemeService$ThemeData;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/server/ThemeService$ThemeData;-><init>(Lcom/android/server/ThemeService;Ljava/lang/String;Ljava/util/List;)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 716
    iget-object v1, p0, Lcom/android/server/ThemeService;->mHandler:Lcom/android/server/ThemeService$ThemeWorkerHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/ThemeService$ThemeWorkerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 717
    return-void
.end method

.method public requestThemeChangeUpdates(Landroid/content/res/IThemeChangeListener;)V
    .locals 3
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 697
    iget-object v0, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_THEME_MANAGER"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    iget-object v0, p0, Lcom/android/server/ThemeService;->mClients:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z

    .line 700
    return-void
.end method

.method public systemRunning()V
    .locals 3

    .prologue
    .line 154
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.WALLPAPER_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 155
    .local v0, filter:Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/android/server/ThemeService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/server/ThemeService;->mWallpaperChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 156
    return-void
.end method
