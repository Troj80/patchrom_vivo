.class public Landroid/media/EncoderCapabilities;
.super Ljava/lang/Object;
.source "EncoderCapabilities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/EncoderCapabilities$AudioEncoderCap;,
        Landroid/media/EncoderCapabilities$VideoEncoderCap;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "EncoderCapabilities"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 111
    const-string v0, "media_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 112
    invoke-static {}, Landroid/media/EncoderCapabilities;->native_init()V

    .line 113
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAudioEncoders()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/media/EncoderCapabilities$AudioEncoderCap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 150
    invoke-static {}, Landroid/media/EncoderCapabilities;->native_get_num_audio_encoders()I

    move-result v2

    .line 151
    .local v2, nEncoders:I
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 157
    :cond_0
    return-object v0

    .line 153
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v0, encoderList:Ljava/util/List;,"Ljava/util/List<Landroid/media/EncoderCapabilities$AudioEncoderCap;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 155
    invoke-static {v1}, Landroid/media/EncoderCapabilities;->native_get_audio_encoder_cap(I)Landroid/media/EncoderCapabilities$AudioEncoderCap;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getOutputFileFormats()[I
    .locals 4

    .prologue
    .line 120
    invoke-static {}, Landroid/media/EncoderCapabilities;->native_get_num_file_formats()I

    move-result v2

    .line 121
    .local v2, nFormats:I
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 127
    :cond_0
    return-object v0

    .line 123
    :cond_1
    new-array v0, v2, [I

    .line 124
    .local v0, formats:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 125
    invoke-static {v1}, Landroid/media/EncoderCapabilities;->native_get_file_format(I)I

    move-result v3

    aput v3, v0, v1

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getVideoEncoders()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/media/EncoderCapabilities$VideoEncoderCap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    invoke-static {}, Landroid/media/EncoderCapabilities;->native_get_num_video_encoders()I

    move-result v2

    .line 136
    .local v2, nEncoders:I
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 142
    :cond_0
    return-object v0

    .line 138
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v0, encoderList:Ljava/util/List;,"Ljava/util/List<Landroid/media/EncoderCapabilities$VideoEncoderCap;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 140
    invoke-static {v1}, Landroid/media/EncoderCapabilities;->native_get_video_encoder_cap(I)Landroid/media/EncoderCapabilities$VideoEncoderCap;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static final native native_get_audio_encoder_cap(I)Landroid/media/EncoderCapabilities$AudioEncoderCap;
.end method

.method private static final native native_get_file_format(I)I
.end method

.method private static final native native_get_num_audio_encoders()I
.end method

.method private static final native native_get_num_file_formats()I
.end method

.method private static final native native_get_num_video_encoders()I
.end method

.method private static final native native_get_video_encoder_cap(I)Landroid/media/EncoderCapabilities$VideoEncoderCap;
.end method

.method private static final native native_init()V
.end method
