.class Landroid/net/MobileDataStateTracker$NetworkDataEntry;
.super Ljava/lang/Object;
.source "MobileDataStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/net/MobileDataStateTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NetworkDataEntry"
.end annotation


# instance fields
.field public downloadBandwidth:I

.field public latency:I

.field public networkType:I

.field public uploadBandwidth:I


# direct methods
.method constructor <init>(IIII)V
    .locals 0
    .parameter "i1"
    .parameter "i2"
    .parameter "i3"
    .parameter "i4"

    .prologue
    .line 977
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 978
    iput p1, p0, Landroid/net/MobileDataStateTracker$NetworkDataEntry;->networkType:I

    .line 979
    iput p2, p0, Landroid/net/MobileDataStateTracker$NetworkDataEntry;->downloadBandwidth:I

    .line 980
    iput p3, p0, Landroid/net/MobileDataStateTracker$NetworkDataEntry;->uploadBandwidth:I

    .line 981
    iput p4, p0, Landroid/net/MobileDataStateTracker$NetworkDataEntry;->latency:I

    .line 982
    return-void
.end method
