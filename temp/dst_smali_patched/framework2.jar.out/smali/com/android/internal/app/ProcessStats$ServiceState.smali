.class public final Lcom/android/internal/app/ProcessStats$ServiceState;
.super Lcom/android/internal/app/ProcessStats$DurationsTable;
.source "ProcessStats.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/app/ProcessStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ServiceState"
.end annotation


# static fields
.field public static final SERVICE_BOUND:I = 0x2

.field static final SERVICE_COUNT:I = 0x4

.field public static final SERVICE_EXEC:I = 0x3

.field public static final SERVICE_RUN:I = 0x0

.field public static final SERVICE_STARTED:I = 0x1


# instance fields
.field mBoundCount:I

.field mBoundStartTime:J

.field public mBoundState:I

.field mExecCount:I

.field mExecStartTime:J

.field public mExecState:I

.field mOwner:Ljava/lang/Object;

.field public final mPackage:Ljava/lang/String;

.field mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

.field public final mProcessName:Ljava/lang/String;

.field mRestarting:Z

.field mRunCount:I

.field mRunStartTime:J

.field public mRunState:I

.field mStarted:Z

.field mStartedCount:I

.field mStartedStartTime:J

.field public mStartedState:I


# direct methods
.method public constructor <init>(Lcom/android/internal/app/ProcessStats;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/app/ProcessStats$ProcessState;)V
    .locals 1
    .parameter "processStats"
    .parameter "pkg"
    .parameter "name"
    .parameter "processName"
    .parameter "proc"

    .prologue
    const/4 v0, -0x1

    .line 2942
    invoke-direct {p0, p1, p3}, Lcom/android/internal/app/ProcessStats$DurationsTable;-><init>(Lcom/android/internal/app/ProcessStats;Ljava/lang/String;)V

    .line 2923
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    .line 2929
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    .line 2933
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    .line 2937
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    .line 2943
    iput-object p2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    .line 2944
    iput-object p4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProcessName:Ljava/lang/String;

    .line 2945
    iput-object p5, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    .line 2946
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/app/ProcessStats$ServiceState;IIJIJ)J
    .locals 2
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 2909
    invoke-direct/range {p0 .. p7}, Lcom/android/internal/app/ProcessStats$ServiceState;->getDuration(IIJIJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private getDuration(IIJIJ)J
    .locals 5
    .parameter "opType"
    .parameter "curState"
    .parameter "startTime"
    .parameter "memFactor"
    .parameter "now"

    .prologue
    .line 3166
    mul-int/lit8 v3, p5, 0x4

    add-int v0, p1, v3

    .line 3167
    .local v0, state:I
    invoke-virtual {p0, v0, p6, p7}, Lcom/android/internal/app/ProcessStats$ServiceState;->getDuration(IJ)J

    move-result-wide v1

    .line 3168
    .local v1, time:J
    if-ne p2, p5, :cond_0

    .line 3169
    sub-long v3, p6, p3

    add-long/2addr v1, v3

    .line 3171
    :cond_0
    return-wide v1
.end method

.method private updateRunning(IJ)V
    .locals 4
    .parameter "memFactor"
    .parameter "now"

    .prologue
    const/4 v1, -0x1

    .line 3077
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-ne v2, v1, :cond_0

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-ne v2, v1, :cond_0

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v1, :cond_3

    :cond_0
    move v0, p1

    .line 3079
    .local v0, state:I
    :goto_0
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    if-eq v2, v0, :cond_2

    .line 3080
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    if-eq v2, v1, :cond_4

    .line 3081
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    mul-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x0

    iget-wide v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunStartTime:J

    sub-long v2, p2, v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3086
    :cond_1
    :goto_1
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    .line 3087
    iput-wide p2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunStartTime:J

    .line 3089
    :cond_2
    return-void

    .end local v0           #state:I
    :cond_3
    move v0, v1

    .line 3077
    goto :goto_0

    .line 3083
    .restart local v0       #state:I
    :cond_4
    if-eq v0, v1, :cond_1

    .line 3084
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    goto :goto_1
.end method


# virtual methods
.method add(Lcom/android/internal/app/ProcessStats$ServiceState;)V
    .locals 2
    .parameter "other"

    .prologue
    .line 3021
    invoke-virtual {p0, p1}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDurations(Lcom/android/internal/app/ProcessStats$DurationsTable;)V

    .line 3022
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    iget v1, p1, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    .line 3023
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    iget v1, p1, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    .line 3024
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    iget v1, p1, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    .line 3025
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    iget v1, p1, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    .line 3026
    return-void
.end method

.method public applyNewOwner(Ljava/lang/Object;)V
    .locals 5
    .parameter "newOwner"

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 2949
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-eq v2, p1, :cond_0

    .line 2950
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 2951
    iput-object p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    .line 2952
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    iget-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/android/internal/app/ProcessStats$ProcessState;->incActiveServices(Ljava/lang/String;)V

    .line 2980
    :cond_0
    :goto_0
    return-void

    .line 2956
    :cond_1
    iput-object p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    .line 2957
    iget-boolean v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    if-nez v2, :cond_2

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-ne v2, v4, :cond_2

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v4, :cond_0

    .line 2958
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 2959
    .local v0, now:J
    iget-boolean v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    if-eqz v2, :cond_3

    .line 2963
    invoke-virtual {p0, v3, v3, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setStarted(ZIJ)V

    .line 2965
    :cond_3
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v2, v4, :cond_4

    .line 2969
    invoke-virtual {p0, v3, v3, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setBound(ZIJ)V

    .line 2971
    :cond_4
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v4, :cond_0

    .line 2975
    invoke-virtual {p0, v3, v3, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setExecuting(ZIJ)V

    goto :goto_0
.end method

.method public clearCurrentOwner(Ljava/lang/Object;Z)V
    .locals 7
    .parameter "owner"
    .parameter "silently"

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 2983
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-ne v2, p1, :cond_7

    .line 2984
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    iget-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/android/internal/app/ProcessStats$ProcessState;->decActiveServices(Ljava/lang/String;)V

    .line 2985
    iget-boolean v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    if-nez v2, :cond_0

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-ne v2, v6, :cond_0

    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v6, :cond_6

    .line 2986
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 2987
    .local v0, now:J
    iget-boolean v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    if-eqz v2, :cond_2

    .line 2988
    if-nez p2, :cond_1

    .line 2989
    const-string v2, "ProcessStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service owner "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cleared while started: pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " service="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " proc="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtfStack(Ljava/lang/String;Ljava/lang/String;)I

    .line 2993
    :cond_1
    invoke-virtual {p0, v5, v5, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setStarted(ZIJ)V

    .line 2995
    :cond_2
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v2, v6, :cond_4

    .line 2996
    if-nez p2, :cond_3

    .line 2997
    const-string v2, "ProcessStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service owner "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cleared while bound: pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " service="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " proc="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtfStack(Ljava/lang/String;Ljava/lang/String;)I

    .line 3001
    :cond_3
    invoke-virtual {p0, v5, v5, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setBound(ZIJ)V

    .line 3003
    :cond_4
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v6, :cond_6

    .line 3004
    if-nez p2, :cond_5

    .line 3005
    const-string v2, "ProcessStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service owner "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cleared while exec: pkg="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " service="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " proc="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtfStack(Ljava/lang/String;Ljava/lang/String;)I

    .line 3009
    :cond_5
    invoke-virtual {p0, v5, v5, v0, v1}, Lcom/android/internal/app/ProcessStats$ServiceState;->setExecuting(ZIJ)V

    .line 3012
    .end local v0           #now:J
    :cond_6
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    .line 3014
    :cond_7
    return-void
.end method

.method commitStateTime(J)V
    .locals 4
    .parameter "now"

    .prologue
    const/4 v3, -0x1

    .line 3057
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    if-eq v0, v3, :cond_0

    .line 3058
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x0

    iget-wide v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunStartTime:J

    sub-long v1, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3059
    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunStartTime:J

    .line 3061
    :cond_0
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-eq v0, v3, :cond_1

    .line 3062
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    iget-wide v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedStartTime:J

    sub-long v1, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3064
    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedStartTime:J

    .line 3066
    :cond_1
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v0, v3, :cond_2

    .line 3067
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x2

    iget-wide v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundStartTime:J

    sub-long v1, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3068
    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundStartTime:J

    .line 3070
    :cond_2
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v0, v3, :cond_3

    .line 3071
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x3

    iget-wide v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecStartTime:J

    sub-long v1, p1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3072
    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecStartTime:J

    .line 3074
    :cond_3
    return-void
.end method

.method public isInUse()Z
    .locals 1

    .prologue
    .line 3017
    iget-object v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRestarting:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method readFromParcel(Landroid/os/Parcel;)Z
    .locals 1
    .parameter "in"

    .prologue
    .line 3046
    invoke-virtual {p0, p1}, Lcom/android/internal/app/ProcessStats$ServiceState;->readDurationsFromParcel(Landroid/os/Parcel;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3047
    const/4 v0, 0x0

    .line 3053
    :goto_0
    return v0

    .line 3049
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    .line 3050
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    .line 3051
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    .line 3052
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    .line 3053
    const/4 v0, 0x1

    goto :goto_0
.end method

.method resetSafely(J)V
    .locals 4
    .parameter "now"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 3029
    invoke-virtual {p0}, Lcom/android/internal/app/ProcessStats$ServiceState;->resetDurationsSafely()V

    .line 3030
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunState:I

    if-eq v0, v3, :cond_0

    move v0, v1

    :goto_0
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    .line 3031
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-eq v0, v3, :cond_1

    move v0, v1

    :goto_1
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    .line 3032
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v0, v3, :cond_2

    move v0, v1

    :goto_2
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    .line 3033
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v0, v3, :cond_3

    :goto_3
    iput v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    .line 3034
    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecStartTime:J

    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundStartTime:J

    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedStartTime:J

    iput-wide p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunStartTime:J

    .line 3035
    return-void

    :cond_0
    move v0, v2

    .line 3030
    goto :goto_0

    :cond_1
    move v0, v2

    .line 3031
    goto :goto_1

    :cond_2
    move v0, v2

    .line 3032
    goto :goto_2

    :cond_3
    move v1, v2

    .line 3033
    goto :goto_3
.end method

.method public setBound(ZIJ)V
    .locals 5
    .parameter "bound"
    .parameter "memFactor"
    .parameter "now"

    .prologue
    const/4 v1, -0x1

    .line 3130
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 3131
    const-string v2, "ProcessStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Binding service "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " without owner"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 3133
    :cond_0
    if-eqz p1, :cond_3

    move v0, p2

    .line 3134
    .local v0, state:I
    :goto_0
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v2, v0, :cond_2

    .line 3135
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    if-eq v2, v1, :cond_4

    .line 3136
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    mul-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x2

    iget-wide v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundStartTime:J

    sub-long v2, p3, v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3141
    :cond_1
    :goto_1
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundState:I

    .line 3142
    iput-wide p3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundStartTime:J

    .line 3143
    invoke-direct {p0, p2, p3, p4}, Lcom/android/internal/app/ProcessStats$ServiceState;->updateRunning(IJ)V

    .line 3145
    :cond_2
    return-void

    .end local v0           #state:I
    :cond_3
    move v0, v1

    .line 3133
    goto :goto_0

    .line 3138
    .restart local v0       #state:I
    :cond_4
    if-eqz p1, :cond_1

    .line 3139
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    goto :goto_1
.end method

.method public setExecuting(ZIJ)V
    .locals 5
    .parameter "executing"
    .parameter "memFactor"
    .parameter "now"

    .prologue
    const/4 v1, -0x1

    .line 3148
    iget-object v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 3149
    const-string v2, "ProcessStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Executing service "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " without owner"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 3151
    :cond_0
    if-eqz p1, :cond_3

    move v0, p2

    .line 3152
    .local v0, state:I
    :goto_0
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v0, :cond_2

    .line 3153
    iget v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    if-eq v2, v1, :cond_4

    .line 3154
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    mul-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x3

    iget-wide v2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecStartTime:J

    sub-long v2, p3, v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3158
    :cond_1
    :goto_1
    iput v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecState:I

    .line 3159
    iput-wide p3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecStartTime:J

    .line 3160
    invoke-direct {p0, p2, p3, p4}, Lcom/android/internal/app/ProcessStats$ServiceState;->updateRunning(IJ)V

    .line 3162
    :cond_2
    return-void

    .end local v0           #state:I
    :cond_3
    move v0, v1

    .line 3151
    goto :goto_0

    .line 3155
    .restart local v0       #state:I
    :cond_4
    if-eqz p1, :cond_1

    .line 3156
    iget v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    goto :goto_1
.end method

.method public setRestarting(ZIJ)V
    .locals 0
    .parameter "restarting"
    .parameter "memFactor"
    .parameter "now"

    .prologue
    .line 3100
    iput-boolean p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRestarting:Z

    .line 3101
    invoke-virtual {p0, p2, p3, p4}, Lcom/android/internal/app/ProcessStats$ServiceState;->updateStartedState(IJ)V

    .line 3102
    return-void
.end method

.method public setStarted(ZIJ)V
    .locals 3
    .parameter "started"
    .parameter "memFactor"
    .parameter "now"

    .prologue
    .line 3092
    iget-object v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mOwner:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 3093
    const-string v0, "ProcessStats"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Starting service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " without owner"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 3095
    :cond_0
    iput-boolean p1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    .line 3096
    invoke-virtual {p0, p2, p3, p4}, Lcom/android/internal/app/ProcessStats$ServiceState;->updateStartedState(IJ)V

    .line 3097
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 3175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ServiceState{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " proc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method updateStartedState(IJ)V
    .locals 7
    .parameter "memFactor"
    .parameter "now"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 3105
    iget v6, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-eq v6, v5, :cond_4

    move v2, v3

    .line 3106
    .local v2, wasStarted:Z
    :goto_0
    iget-boolean v6, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStarted:Z

    if-nez v6, :cond_0

    iget-boolean v6, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRestarting:Z

    if-eqz v6, :cond_5

    :cond_0
    move v0, v3

    .line 3107
    .local v0, started:Z
    :goto_1
    if-eqz v0, :cond_6

    move v1, p1

    .line 3108
    .local v1, state:I
    :goto_2
    iget v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-eq v3, v1, :cond_3

    .line 3109
    iget v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    if-eq v3, v5, :cond_7

    .line 3110
    iget v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x1

    iget-wide v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedStartTime:J

    sub-long v4, p2, v4

    invoke-virtual {p0, v3, v4, v5}, Lcom/android/internal/app/ProcessStats$ServiceState;->addDuration(IJ)V

    .line 3115
    :cond_1
    :goto_3
    iput v1, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedState:I

    .line 3116
    iput-wide p2, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedStartTime:J

    .line 3117
    iget-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mPackage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/internal/app/ProcessStats$ProcessState;->pullFixedProc(Ljava/lang/String;)Lcom/android/internal/app/ProcessStats$ProcessState;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    .line 3118
    if-eq v2, v0, :cond_2

    .line 3119
    if-eqz v0, :cond_8

    .line 3120
    iget-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v3, p1, p2, p3, v4}, Lcom/android/internal/app/ProcessStats$ProcessState;->incStartedServices(IJLjava/lang/String;)V

    .line 3125
    :cond_2
    :goto_4
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/app/ProcessStats$ServiceState;->updateRunning(IJ)V

    .line 3127
    :cond_3
    return-void

    .end local v0           #started:Z
    .end local v1           #state:I
    .end local v2           #wasStarted:Z
    :cond_4
    move v2, v4

    .line 3105
    goto :goto_0

    .restart local v2       #wasStarted:Z
    :cond_5
    move v0, v4

    .line 3106
    goto :goto_1

    .restart local v0       #started:Z
    :cond_6
    move v1, v5

    .line 3107
    goto :goto_2

    .line 3112
    .restart local v1       #state:I
    :cond_7
    if-eqz v0, :cond_1

    .line 3113
    iget v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    goto :goto_3

    .line 3122
    :cond_8
    iget-object v3, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mProc:Lcom/android/internal/app/ProcessStats$ProcessState;

    iget-object v4, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mName:Ljava/lang/String;

    invoke-virtual {v3, p1, p2, p3, v4}, Lcom/android/internal/app/ProcessStats$ProcessState;->decStartedServices(IJLjava/lang/String;)V

    goto :goto_4
.end method

.method writeToParcel(Landroid/os/Parcel;J)V
    .locals 1
    .parameter "out"
    .parameter "now"

    .prologue
    .line 3038
    invoke-virtual {p0, p1}, Lcom/android/internal/app/ProcessStats$ServiceState;->writeDurationsToParcel(Landroid/os/Parcel;)V

    .line 3039
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mRunCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 3040
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mStartedCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 3041
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mBoundCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 3042
    iget v0, p0, Lcom/android/internal/app/ProcessStats$ServiceState;->mExecCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 3043
    return-void
.end method
