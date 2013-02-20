.class public Landroid/media/MediaRecorder;
.super Ljava/lang/Object;
.source "MediaRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/MediaRecorder$PrivacyRunner;,
        Landroid/media/MediaRecorder$EventHandler;,
        Landroid/media/MediaRecorder$OnInfoListener;,
        Landroid/media/MediaRecorder$OnErrorListener;,
        Landroid/media/MediaRecorder$VideoEncoder;,
        Landroid/media/MediaRecorder$AudioEncoder;,
        Landroid/media/MediaRecorder$OutputFormat;,
        Landroid/media/MediaRecorder$VideoSource;,
        Landroid/media/MediaRecorder$AudioSource;
    }
.end annotation


# static fields
.field private static final BOTH_DATA_ACCESS:I = 0xb

.field private static final GOT_ERROR:I = -0x3

.field private static final IS_ALLOWED:I = -0x1

.field private static final IS_NOT_ALLOWED:I = -0x2

.field public static final MEDIA_ERROR_SERVER_DIED:I = 0x64

.field public static final MEDIA_RECORDER_ERROR_UNKNOWN:I = 0x1

.field public static final MEDIA_RECORDER_INFO_MAX_DURATION_REACHED:I = 0x320

.field public static final MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED:I = 0x321

.field public static final MEDIA_RECORDER_INFO_UNKNOWN:I = 0x1

.field public static final MEDIA_RECORDER_TRACK_INFO_COMPLETION_STATUS:I = 0x3e8

.field public static final MEDIA_RECORDER_TRACK_INFO_DATA_KBYTES:I = 0x3f1

.field public static final MEDIA_RECORDER_TRACK_INFO_DURATION_MS:I = 0x3eb

.field public static final MEDIA_RECORDER_TRACK_INFO_ENCODED_FRAMES:I = 0x3ed

.field public static final MEDIA_RECORDER_TRACK_INFO_INITIAL_DELAY_MS:I = 0x3ef

.field public static final MEDIA_RECORDER_TRACK_INFO_LIST_END:I = 0x7d0

.field public static final MEDIA_RECORDER_TRACK_INFO_LIST_START:I = 0x3e8

.field public static final MEDIA_RECORDER_TRACK_INFO_MAX_CHUNK_DUR_MS:I = 0x3ec

.field public static final MEDIA_RECORDER_TRACK_INFO_PROGRESS_IN_TIME:I = 0x3e9

.field public static final MEDIA_RECORDER_TRACK_INFO_START_OFFSET_MS:I = 0x3f0

.field public static final MEDIA_RECORDER_TRACK_INFO_TYPE:I = 0x3ea

.field public static final MEDIA_RECORDER_TRACK_INTER_CHUNK_TIME_MS:I = 0x3ee

.field private static final MIC_DATA_ACCESS:I = 0xa

.field private static final MODE_RECORD_AUDIO:I = 0x2

.field private static final MODE_RECORD_BOTH:I = 0x3

.field private static final PRIVACY_PATH_DEF:Ljava/lang/String; = "/data/data/"

.field private static final PRIVACY_TAG:Ljava/lang/String; = "PM,MediaRecorder"

.field private static final STATE_RECORD_AUDIO:I = 0x0

.field private static final STATE_RECORD_BOTH:I = 0x1

.field private static final TAG:Ljava/lang/String; = "MediaRecorder"


# instance fields
.field private ACTUAL_STATE:I

.field private context:Landroid/content/Context;

.field private deletedFile:Z

.field private mEventHandler:Landroid/media/MediaRecorder$EventHandler;

.field private mFd:Ljava/io/FileDescriptor;

.field private mNativeContext:I

.field private mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

.field private mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

.field private mPath:Ljava/lang/String;

.field private mPm:Landroid/content/pm/IPackageManager;

.field private mSurface:Landroid/view/Surface;

.field private pFileDescriptor:Ljava/io/FileDescriptor;

.field private pFileDescriptorPath:Ljava/lang/String;

.field private pPath:Ljava/lang/String;

.field private pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

.field private pSetMan:Landroid/privacy/PrivacySettingsManager;

.field private privacyMode:Z

.field private stoppedStream:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string/jumbo v0, "media_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Landroid/media/MediaRecorder;->native_init()V

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Landroid/media/MediaRecorder;->pPath:Ljava/lang/String;

    iput-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    iput-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptor:Ljava/io/FileDescriptor;

    iput-object v1, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->privacyMode:Z

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->stoppedStream:Z

    iput v2, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_2e

    new-instance v1, Landroid/media/MediaRecorder$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Landroid/media/MediaRecorder$EventHandler;-><init>(Landroid/media/MediaRecorder;Landroid/media/MediaRecorder;Landroid/os/Looper;)V

    iput-object v1, p0, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    :goto_22
    invoke-direct {p0}, Landroid/media/MediaRecorder;->initiate()V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v1}, Landroid/media/MediaRecorder;->native_setup(Ljava/lang/Object;)V

    return-void

    :cond_2e
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_3c

    new-instance v1, Landroid/media/MediaRecorder$EventHandler;

    invoke-direct {v1, p0, p0, v0}, Landroid/media/MediaRecorder$EventHandler;-><init>(Landroid/media/MediaRecorder;Landroid/media/MediaRecorder;Landroid/os/Looper;)V

    iput-object v1, p0, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    goto :goto_22

    :cond_3c
    iput-object v1, p0, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    goto :goto_22
.end method

.method private native _prepare()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method private native _setOutputFile(Ljava/io/FileDescriptor;JJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method static synthetic access$000(Landroid/media/MediaRecorder;)I
    .registers 2

    iget v0, p0, Landroid/media/MediaRecorder;->mNativeContext:I

    return v0
.end method

.method static synthetic access$100(Landroid/media/MediaRecorder;)Landroid/media/MediaRecorder$OnErrorListener;
    .registers 2

    iget-object v0, p0, Landroid/media/MediaRecorder;->mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$200(Landroid/media/MediaRecorder;)Landroid/media/MediaRecorder$OnInfoListener;
    .registers 2

    iget-object v0, p0, Landroid/media/MediaRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    return-object v0
.end method

.method static synthetic access$300(Landroid/media/MediaRecorder;)V
    .registers 1

    invoke-direct {p0}, Landroid/media/MediaRecorder;->privacyStop()V

    return-void
.end method

.method static synthetic access$400(Landroid/media/MediaRecorder;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Landroid/media/MediaRecorder;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    return p1
.end method

.method static synthetic access$600(Landroid/media/MediaRecorder;)Ljava/io/FileDescriptor;
    .registers 2

    iget-object v0, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    return-object v0
.end method

.method static synthetic access$700(Landroid/media/MediaRecorder;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    return-object v0
.end method

.method private checkIfPackagesAllowed(I)I
    .registers 12

    const/4 v6, -0x1

    const/4 v5, -0x2

    const/4 v7, -0x3

    :try_start_3
    iget-object v8, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    if-eqz v8, :cond_5b

    const/4 v2, 0x0

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v4

    if-eqz v3, :cond_51

    packed-switch p1, :pswitch_data_72

    move v5, v7

    :cond_16
    :goto_16
    return v5

    :pswitch_17
    const/4 v1, 0x0

    :goto_18
    array-length v8, v3

    if-ge v1, v8, :cond_2f

    iget-object v8, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    aget-object v9, v3, v1

    invoke-virtual {v8, v9, v4}, Landroid/privacy/PrivacySettingsManager;->getSettings(Ljava/lang/String;I)Landroid/privacy/PrivacySettings;

    move-result-object v2

    if-eqz v2, :cond_2b

    invoke-virtual {v2}, Landroid/privacy/PrivacySettings;->getRecordAudioSetting()B

    move-result v8

    if-nez v8, :cond_16

    :cond_2b
    const/4 v2, 0x0

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_2f
    move v5, v6

    goto :goto_16

    :pswitch_31
    const/4 v1, 0x0

    :goto_32
    array-length v8, v3

    if-ge v1, v8, :cond_4f

    iget-object v8, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    aget-object v9, v3, v1

    invoke-virtual {v8, v9, v4}, Landroid/privacy/PrivacySettingsManager;->getSettings(Ljava/lang/String;I)Landroid/privacy/PrivacySettings;

    move-result-object v2

    if-eqz v2, :cond_4b

    invoke-virtual {v2}, Landroid/privacy/PrivacySettings;->getRecordAudioSetting()B

    move-result v8

    if-nez v8, :cond_16

    invoke-virtual {v2}, Landroid/privacy/PrivacySettings;->getCameraSetting()B

    move-result v8

    if-nez v8, :cond_16

    :cond_4b
    const/4 v2, 0x0

    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    :cond_4f
    move v5, v6

    goto :goto_16

    :cond_51
    const-string v5, "PM,MediaRecorder"

    const-string/jumbo v6, "return GOT_ERROR, because package_names are NULL"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v7

    goto :goto_16

    :cond_5b
    const-string v5, "PM,MediaRecorder"

    const-string/jumbo v6, "return GOT_ERROR, because pSetMan is NULL"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_63} :catch_65

    move v5, v7

    goto :goto_16

    :catch_65
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v5, "PM,MediaRecorder"

    const-string v6, "Got exception in checkIfPackagesAllowed"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v5, v7

    goto :goto_16

    :pswitch_data_72
    .packed-switch 0x2
        :pswitch_17
        :pswitch_31
    .end packed-switch
.end method

.method private dataAccess(ZI)V
    .registers 8

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_5a

    if-eqz v1, :cond_5a

    packed-switch p2, :pswitch_data_ae

    :cond_b
    :goto_b
    return-void

    :pswitch_c
    const/4 v0, 0x0

    :goto_d
    array-length v2, v1

    if-ge v0, v2, :cond_b

    const-string v2, "PM,MediaRecorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Allowed Package: -"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "- accessing microphone."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :pswitch_33
    const/4 v0, 0x0

    :goto_34
    array-length v2, v1

    if-ge v0, v2, :cond_b

    const-string v2, "PM,MediaRecorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Allowed Package: -"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "- accessing microphone and camera."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    :cond_5a
    if-eqz v1, :cond_b

    packed-switch p2, :pswitch_data_b6

    goto :goto_b

    :pswitch_60
    const/4 v0, 0x0

    :goto_61
    array-length v2, v1

    if-ge v0, v2, :cond_b

    const-string v2, "PM,MediaRecorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Blocked Package: -"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "- accessing microphone."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_61

    :pswitch_87
    const/4 v0, 0x0

    :goto_88
    array-length v2, v1

    if-ge v0, v2, :cond_b

    const-string v2, "PM,MediaRecorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Blocked Package: -"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "- accessing microphone and camera."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_88

    :pswitch_data_ae
    .packed-switch 0xa
        :pswitch_c
        :pswitch_33
    .end packed-switch

    :pswitch_data_b6
    .packed-switch 0xa
        :pswitch_60
        :pswitch_87
    .end packed-switch
.end method

.method public static final getAudioSourceMax()I
    .registers 1

    const/16 v0, 0x8

    return v0
.end method

.method private getPackageName()[Ljava/lang/String;
    .registers 6

    :try_start_0
    iget-object v3, p0, Landroid/media/MediaRecorder;->mPm:Landroid/content/pm/IPackageManager;

    if-eqz v3, :cond_f

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    iget-object v3, p0, Landroid/media/MediaRecorder;->mPm:Landroid/content/pm/IPackageManager;

    invoke-interface {v3, v2}, Landroid/content/pm/IPackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    const-string/jumbo v3, "package"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v3

    iput-object v3, p0, Landroid/media/MediaRecorder;->mPm:Landroid/content/pm/IPackageManager;

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v2

    iget-object v3, p0, Landroid/media/MediaRecorder;->mPm:Landroid/content/pm/IPackageManager;

    invoke-interface {v3, v2}, Landroid/content/pm/IPackageManager;->getPackagesForUid(I)[Ljava/lang/String;
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_27

    move-result-object v1

    goto :goto_e

    :catch_27
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v3, "PM,MediaRecorder"

    const-string/jumbo v4, "something went wrong with getting package name"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    goto :goto_e
.end method

.method private getPrivacyFileDescriptor()Ljava/io/FileDescriptor;
    .registers 19

    invoke-direct/range {p0 .. p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v12

    new-instance v14, Ljava/util/Random;

    invoke-direct {v14}, Ljava/util/Random;-><init>()V

    const/4 v1, 0x0

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14}, Ljava/util/Random;->nextLong()J

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".tmp"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v11, 0x0

    :goto_24
    array-length v15, v12

    if-ge v11, v15, :cond_247

    :try_start_27
    new-instance v9, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    aget-object v16, v12, v11

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/cache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v9, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    new-instance v8, Ljava/io/FileWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    aget-object v16, v12, v11

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/cache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v8, v15}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_6e
    .catchall {:try_start_27 .. :try_end_6e} :catchall_155
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_6e} :catch_15c

    :try_start_6e
    const-string/jumbo v15, "test"

    invoke-virtual {v8, v15}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/FileWriter;->flush()V

    invoke-virtual {v8}, Ljava/io/FileWriter;->close()V

    new-instance v4, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    aget-object v16, v12, v11

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/cache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v4, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_9e
    .catchall {:try_start_6e .. :try_end_9e} :catchall_235
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_9e} :catch_23e

    :try_start_9e
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    const-string v15, "PM,MediaRecorder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "found our package: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    aget-object v17, v12, v11

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " with internal path. File: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    aget-object v1, v12, v11
    :try_end_c9
    .catchall {:try_start_9e .. :try_end_c9} :catchall_239
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_c9} :catch_242

    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    move-object v4, v3

    move-object v8, v7

    :goto_d0
    if-eqz v1, :cond_172

    :try_start_d2
    new-instance v10, Ljava/io/FileOutputStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/cache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v6

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "/data/data/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/cache/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    const-string v15, "PM,MediaRecorder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "returned fileDescriptor for package: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " with internal path. Path: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "/data/data/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "/cache/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_152
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_152} :catch_166

    move-object v3, v4

    move-object v7, v8

    :goto_154
    return-object v6

    :catchall_155
    move-exception v15

    :goto_156
    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    throw v15

    :catch_15c
    move-exception v15

    :goto_15d
    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_24

    :catch_166
    move-exception v5

    const-string v15, "PM,MediaRecorder"

    const-string v16, "Got exception while creating fileDescriptor -> return null"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x0

    move-object v3, v4

    move-object v7, v8

    goto :goto_154

    :cond_172
    :try_start_172
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    new-instance v7, Ljava/io/FileWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v15}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_196
    .catch Ljava/lang/Exception; {:try_start_172 .. :try_end_196} :catch_22e

    :try_start_196
    const-string/jumbo v15, "test"

    invoke-virtual {v7, v15}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/FileWriter;->flush()V

    invoke-virtual {v7}, Ljava/io/FileWriter;->close()V

    new-instance v3, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v3, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_196 .. :try_end_1be} :catch_232

    :try_start_1be
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    new-instance v10, Ljava/io/FileOutputStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v6

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    const-string v15, "PM,MediaRecorder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Returned FileDescriptor. Path:  "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " . It is on SDCard!"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_228
    .catch Ljava/lang/Exception; {:try_start_1be .. :try_end_228} :catch_22a

    goto/16 :goto_154

    :catch_22a
    move-exception v5

    :goto_22b
    const/4 v6, 0x0

    goto/16 :goto_154

    :catch_22e
    move-exception v5

    move-object v3, v4

    move-object v7, v8

    goto :goto_22b

    :catch_232
    move-exception v5

    move-object v3, v4

    goto :goto_22b

    :catchall_235
    move-exception v15

    move-object v7, v8

    goto/16 :goto_156

    :catchall_239
    move-exception v15

    move-object v3, v4

    move-object v7, v8

    goto/16 :goto_156

    :catch_23e
    move-exception v15

    move-object v7, v8

    goto/16 :goto_15d

    :catch_242
    move-exception v15

    move-object v3, v4

    move-object v7, v8

    goto/16 :goto_15d

    :cond_247
    move-object v4, v3

    move-object v8, v7

    goto/16 :goto_d0
.end method

.method private getPrivacyPath()Ljava/lang/String;
    .registers 16

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v9

    new-instance v11, Ljava/util/Random;

    invoke-direct {v11}, Ljava/util/Random;-><init>()V

    const/4 v0, 0x0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Ljava/util/Random;->nextLong()J

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".tmp"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v8, 0x0

    :goto_24
    array-length v12, v9

    if-ge v8, v12, :cond_1eb

    :try_start_27
    new-instance v7, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "/data/data/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget-object v13, v9, v8

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v7, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    new-instance v6, Ljava/io/FileWriter;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "/data/data/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget-object v13, v9, v8

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_6e
    .catchall {:try_start_27 .. :try_end_6e} :catchall_12d
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_6e} :catch_134

    :try_start_6e
    const-string/jumbo v12, "test"

    invoke-virtual {v6, v12}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/FileWriter;->flush()V

    invoke-virtual {v6}, Ljava/io/FileWriter;->close()V

    new-instance v3, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "/data/data/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget-object v13, v9, v8

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_9e
    .catchall {:try_start_6e .. :try_end_9e} :catchall_1d9
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_9e} :catch_1e2

    :try_start_9e
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    const-string v12, "PM,MediaRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "found our package: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    aget-object v14, v9, v8

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " with internal path. File: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    aget-object v0, v9, v8
    :try_end_c7
    .catchall {:try_start_9e .. :try_end_c7} :catchall_1dd
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_c7} :catch_1e6

    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    move-object v3, v2

    move-object v6, v5

    :goto_ce
    if-eqz v0, :cond_13e

    const-string v12, "PM,MediaRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "returned file: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " for package: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " with internal path. Path: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/data/data/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/cache/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "/data/data/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    move-object v2, v3

    move-object v5, v6

    :goto_12c
    return-object v12

    :catchall_12d
    move-exception v12

    :goto_12e
    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    throw v12

    :catch_134
    move-exception v12

    :goto_135
    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->gc()V

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_24

    :cond_13e
    :try_start_13e
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    new-instance v5, Ljava/io/FileWriter;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v5, v12}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_162
    .catch Ljava/lang/Exception; {:try_start_13e .. :try_end_162} :catch_1ce

    :try_start_162
    const-string/jumbo v12, "test"

    invoke-virtual {v5, v12}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/FileWriter;->flush()V

    invoke-virtual {v5}, Ljava/io/FileWriter;->close()V

    new-instance v2, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v2, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_18a
    .catch Ljava/lang/Exception; {:try_start_162 .. :try_end_18a} :catch_1d4

    :try_start_18a
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    const-string v12, "PM,MediaRecorder"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Return filePath:  "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " . It is on SDCard!"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1cb
    .catch Ljava/lang/Exception; {:try_start_18a .. :try_end_1cb} :catch_1d7

    move-result-object v12

    goto/16 :goto_12c

    :catch_1ce
    move-exception v4

    move-object v2, v3

    move-object v5, v6

    :goto_1d1
    const/4 v12, 0x0

    goto/16 :goto_12c

    :catch_1d4
    move-exception v4

    move-object v2, v3

    goto :goto_1d1

    :catch_1d7
    move-exception v4

    goto :goto_1d1

    :catchall_1d9
    move-exception v12

    move-object v5, v6

    goto/16 :goto_12e

    :catchall_1dd
    move-exception v12

    move-object v2, v3

    move-object v5, v6

    goto/16 :goto_12e

    :catch_1e2
    move-exception v12

    move-object v5, v6

    goto/16 :goto_135

    :catch_1e6
    move-exception v12

    move-object v2, v3

    move-object v5, v6

    goto/16 :goto_135

    :cond_1eb
    move-object v3, v2

    move-object v6, v5

    goto/16 :goto_ce
.end method

.method private initiate()V
    .registers 5

    const/4 v1, 0x0

    :try_start_1
    iput-object v1, p0, Landroid/media/MediaRecorder;->context:Landroid/content/Context;

    new-instance v1, Landroid/privacy/PrivacySettingsManager;

    iget-object v2, p0, Landroid/media/MediaRecorder;->context:Landroid/content/Context;

    const-string/jumbo v3, "privacy"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Landroid/privacy/IPrivacySettingsManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/privacy/IPrivacySettingsManager;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/privacy/PrivacySettingsManager;-><init>(Landroid/content/Context;Landroid/privacy/IPrivacySettingsManager;)V

    iput-object v1, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    const-string/jumbo v1, "package"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v1

    iput-object v1, p0, Landroid/media/MediaRecorder;->mPm:Landroid/content/pm/IPackageManager;

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/media/MediaRecorder;->privacyMode:Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_27} :catch_28

    :goto_27
    return-void

    :catch_28
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v1, "PM,MediaRecorder"

    const-string v2, "Something went wrong with initalize variables"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/media/MediaRecorder;->privacyMode:Z

    goto :goto_27
.end method

.method private final native native_finalize()V
.end method

.method private static final native native_init()V
.end method

.method private native native_reset()V
.end method

.method private final native native_setup(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .registers 8

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/MediaRecorder;

    if-nez v1, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    iget-object v2, v1, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    if-eqz v2, :cond_a

    iget-object v2, v1, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/media/MediaRecorder$EventHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v2, v1, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    invoke-virtual {v2, v0}, Landroid/media/MediaRecorder$EventHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_a
.end method

.method private privacyStop()V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->stop()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    :goto_3
    return-void

    :catch_4
    move-exception v0

    const-string v1, "PM,MediaRecorder"

    const-string v2, "Got exception while trying to call privacyStop()"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method private native setParameter(Ljava/lang/String;)V
.end method


# virtual methods
.method protected finalize()V
    .registers 4

    const/4 v2, 0x1

    iget-boolean v1, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    if-nez v1, :cond_18

    iget-object v1, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    if-eqz v1, :cond_1c

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_18

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    :cond_18
    :goto_18
    invoke-direct {p0}, Landroid/media/MediaRecorder;->native_finalize()V

    return-void

    :cond_1c
    iget-object v1, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    if-eqz v1, :cond_34

    iget-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    if-eqz v1, :cond_34

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_18

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    goto :goto_18

    :cond_34
    const-string v1, "PM,MediaRecorder"

    const-string v2, "Can\'t delete temporary File, because all is null?! It could be that we only want to record audio?!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    goto :goto_18
.end method

.method public native getMaxAmplitude()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public prepare()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Landroid/media/MediaRecorder;->privacyMode:Z

    if-nez v0, :cond_7

    invoke-direct {p0}, Landroid/media/MediaRecorder;->initiate()V

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    const/4 v9, 0x0

    iget v0, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    packed-switch v0, :pswitch_data_102

    :cond_10
    :goto_10
    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v8

    if-nez v9, :cond_31

    iget v0, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_cf

    if-eqz v8, :cond_cf

    array-length v0, v8

    if-lez v0, :cond_cf

    iget-object v0, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    const/4 v1, 0x0

    aget-object v1, v8, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, "camera"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/privacy/PrivacySettingsManager;->notification(Ljava/lang/String;IBLjava/lang/String;Ljava/lang/String;Landroid/privacy/PrivacySettings;)V

    :cond_2e
    :goto_2e
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    :cond_31
    iget-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    if-eqz v0, :cond_ea

    new-instance v7, Ljava/io/FileOutputStream;

    iget-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    invoke-direct {v7, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    :try_start_3c
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Landroid/media/MediaRecorder;->_setOutputFile(Ljava/io/FileDescriptor;JJ)V
    :try_end_48
    .catchall {:try_start_3c .. :try_end_48} :catchall_e5

    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    :goto_4b
    invoke-direct {p0}, Landroid/media/MediaRecorder;->_prepare()V

    return-void

    :pswitch_4f
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->checkIfPackagesAllowed(I)I

    move-result v0

    const/4 v1, -0x2

    if-ne v0, v1, :cond_10

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_6f

    array-length v0, v10

    if-lez v0, :cond_6f

    iget-object v0, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    const/4 v1, 0x0

    aget-object v1, v10, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string/jumbo v4, "recordAudio"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/privacy/PrivacySettingsManager;->notification(Ljava/lang/String;IBLjava/lang/String;Ljava/lang/String;Landroid/privacy/PrivacySettings;)V

    :cond_6f
    new-instance v0, Landroid/media/MediaRecorder$PrivacyRunner;

    invoke-direct {v0, p0}, Landroid/media/MediaRecorder$PrivacyRunner;-><init>(Landroid/media/MediaRecorder;)V

    iput-object v0, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    iget-object v0, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    const-wide/16 v1, 0x32

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaRecorder$PrivacyRunner;->setDelay(J)V

    iget-object v0, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    invoke-virtual {v0}, Landroid/media/MediaRecorder$PrivacyRunner;->start()V

    const/4 v9, 0x1

    goto :goto_10

    :pswitch_84
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->checkIfPackagesAllowed(I)I

    move-result v0

    const/4 v1, -0x2

    if-ne v0, v1, :cond_10

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPackageName()[Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_a3

    array-length v0, v10

    if-lez v0, :cond_a3

    iget-object v0, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    const/4 v1, 0x0

    aget-object v1, v10, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, "camera"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/privacy/PrivacySettingsManager;->notification(Ljava/lang/String;IBLjava/lang/String;Ljava/lang/String;Landroid/privacy/PrivacySettings;)V

    :cond_a3
    iget-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    if-eqz v0, :cond_bc

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPrivacyPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    :goto_ad
    new-instance v0, Landroid/media/MediaRecorder$PrivacyRunner;

    invoke-direct {v0, p0}, Landroid/media/MediaRecorder$PrivacyRunner;-><init>(Landroid/media/MediaRecorder;)V

    iput-object v0, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    iget-object v0, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    invoke-virtual {v0}, Landroid/media/MediaRecorder$PrivacyRunner;->start()V

    const/4 v9, 0x1

    goto/16 :goto_10

    :cond_bc
    iget-object v0, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_c7

    invoke-direct {p0}, Landroid/media/MediaRecorder;->getPrivacyFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    iput-object v0, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    goto :goto_ad

    :cond_c7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No valid output file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_cf
    if-eqz v8, :cond_2e

    array-length v0, v8

    if-lez v0, :cond_2e

    iget-object v0, p0, Landroid/media/MediaRecorder;->pSetMan:Landroid/privacy/PrivacySettingsManager;

    const/4 v1, 0x0

    aget-object v1, v8, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string/jumbo v4, "recordAudio"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/privacy/PrivacySettingsManager;->notification(Ljava/lang/String;IBLjava/lang/String;Ljava/lang/String;Landroid/privacy/PrivacySettings;)V

    goto/16 :goto_2e

    :catchall_e5
    move-exception v0

    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    throw v0

    :cond_ea
    iget-object v0, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_fa

    iget-object v1, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Landroid/media/MediaRecorder;->_setOutputFile(Ljava/io/FileDescriptor;JJ)V

    goto/16 :goto_4b

    :cond_fa
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No valid output file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_102
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_84
    .end packed-switch
.end method

.method public native release()V
.end method

.method public reset()V
    .registers 5

    const/4 v3, 0x0

    const/4 v2, 0x1

    invoke-direct {p0}, Landroid/media/MediaRecorder;->native_reset()V

    iget-boolean v1, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    if-nez v1, :cond_1c

    iget-object v1, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    if-eqz v1, :cond_27

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_1c

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    :cond_1c
    :goto_1c
    iput-object v3, p0, Landroid/media/MediaRecorder;->pRunner:Landroid/media/MediaRecorder$PrivacyRunner;

    invoke-static {}, Ljava/lang/System;->gc()V

    iget-object v1, p0, Landroid/media/MediaRecorder;->mEventHandler:Landroid/media/MediaRecorder$EventHandler;

    invoke-virtual {v1, v3}, Landroid/media/MediaRecorder$EventHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void

    :cond_27
    iget-object v1, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    if-eqz v1, :cond_3f

    iget-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    if-eqz v1, :cond_3f

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Landroid/media/MediaRecorder;->pFileDescriptorPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_1c

    iput-boolean v2, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    goto :goto_1c

    :cond_3f
    const-string v1, "PM,MediaRecorder"

    const-string v2, "Can\'t delete temporary File, because all is null?! It could be that we only want to record audio?!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    goto :goto_1c
.end method

.method public setAudioChannels(I)V
    .registers 4

    if-gtz p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Number of channels is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "audio-param-number-of-channels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public native setAudioEncoder(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public setAudioEncodingBitRate(I)V
    .registers 4

    if-gtz p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Audio encoding bit rate is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "audio-param-encoding-bitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public setAudioSamplingRate(I)V
    .registers 4

    if-gtz p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Audio sampling rate is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "audio-param-sampling-rate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public native setAudioSource(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public setAuxiliaryOutputFile(Ljava/io/FileDescriptor;)V
    .registers 4

    const-string v0, "MediaRecorder"

    const-string/jumbo v1, "setAuxiliaryOutputFile(FileDescriptor) is no longer supported."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setAuxiliaryOutputFile(Ljava/lang/String;)V
    .registers 4

    const-string v0, "MediaRecorder"

    const-string/jumbo v1, "setAuxiliaryOutputFile(String) is no longer supported."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public native setCamera(Landroid/hardware/Camera;)V
.end method

.method public setCaptureRate(D)V
    .registers 8

    const/4 v3, 0x1

    iput v3, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    const-string/jumbo v3, "time-lapse-enable=1"

    invoke-direct {p0, v3}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    const-wide/high16 v3, 0x3ff0

    div-double v0, v3, p1

    const-wide v3, 0x408f400000000000L

    mul-double/2addr v3, v0

    double-to-int v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "time-between-time-lapse-frame-capture="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public setLocation(FF)V
    .registers 11

    const v7, 0x461c4000

    const-wide/high16 v5, 0x3fe0

    mul-float v3, p1, v7

    float-to-double v3, v3

    add-double/2addr v3, v5

    double-to-int v0, v3

    mul-float v3, p2, v7

    float-to-double v3, v3

    add-double/2addr v3, v5

    double-to-int v1, v3

    const v3, 0xdbba0

    if-gt v0, v3, :cond_19

    const v3, -0xdbba0

    if-ge v0, v3, :cond_38

    :cond_19
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Latitude: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " out of range."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_38
    const v3, 0x1b7740

    if-gt v1, v3, :cond_42

    const v3, -0x1b7740

    if-ge v1, v3, :cond_61

    :cond_42
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Longitude: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " out of range"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_61
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "param-geotag-latitude="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "param-geotag-longitude="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public native setMaxDuration(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public native setMaxFileSize(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V
    .registers 2

    iput-object p1, p0, Landroid/media/MediaRecorder;->mOnErrorListener:Landroid/media/MediaRecorder$OnErrorListener;

    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V
    .registers 2

    iput-object p1, p0, Landroid/media/MediaRecorder;->mOnInfoListener:Landroid/media/MediaRecorder$OnInfoListener;

    return-void
.end method

.method public setOrientationHint(I)V
    .registers 5

    if-eqz p1, :cond_27

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_27

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_27

    const/16 v0, 0x10e

    if-eq p1, v0, :cond_27

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported angle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "video-param-rotation-angle-degrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public setOutputFile(Ljava/io/FileDescriptor;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    iput-object p1, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    return-void
.end method

.method public setOutputFile(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/media/MediaRecorder;->mFd:Ljava/io/FileDescriptor;

    iput-object p1, p0, Landroid/media/MediaRecorder;->mPath:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/media/MediaRecorder;->deletedFile:Z

    return-void
.end method

.method public native setOutputFormat(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public setPreviewDisplay(Landroid/view/Surface;)V
    .registers 3

    const/4 v0, 0x1

    iput v0, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    iput-object p1, p0, Landroid/media/MediaRecorder;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method public setProfile(Landroid/media/CamcorderProfile;)V
    .registers 4

    const/4 v0, 0x1

    iput v0, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    iget v0, p1, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v1, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p0, v0, v1}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    iget v0, p1, Landroid/media/CamcorderProfile;->videoBitRate:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->quality:I

    const/16 v1, 0x3e8

    if-lt v0, v1, :cond_2b

    iget v0, p1, Landroid/media/CamcorderProfile;->quality:I

    const/16 v1, 0x3ef

    if-gt v0, v1, :cond_2b

    :goto_2a
    return-void

    :cond_2b
    iget v0, p1, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->audioChannels:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setAudioChannels(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setAudioSamplingRate(I)V

    iget v0, p1, Landroid/media/CamcorderProfile;->audioCodec:I

    invoke-virtual {p0, v0}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    goto :goto_2a
.end method

.method public native setVideoEncoder(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public setVideoEncodingBitRate(I)V
    .registers 4

    const/4 v0, 0x1

    iput v0, p0, Landroid/media/MediaRecorder;->ACTUAL_STATE:I

    if-gtz p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Video encoding bit rate is not positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "video-param-encoding-bitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/media/MediaRecorder;->setParameter(Ljava/lang/String;)V

    return-void
.end method

.method public native setVideoFrameRate(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public native setVideoSize(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public native setVideoSource(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public native start()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public native stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method
