.class public Lcom/android/internal/app/ProcessMap;
.super Ljava/lang/Object;
.source "ProcessMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final mMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    .local p0, this:Lcom/android/internal/app/ProcessMap;,"Lcom/android/internal/app/ProcessMap<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;I)Ljava/lang/Object;
    .locals 2
    .parameter "name"
    .parameter "uid"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)TE;"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, this:Lcom/android/internal/app/ProcessMap;,"Lcom/android/internal/app/ProcessMap<TE;>;"
    iget-object v1, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 28
    .local v0, uids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<TE;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 29
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getMap()Landroid/util/ArrayMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, this:Lcom/android/internal/app/ProcessMap;,"Lcom/android/internal/app/ProcessMap<TE;>;"
    iget-object v0, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    return-object v0
.end method

.method public put(Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "name"
    .parameter "uid"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ITE;)TE;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, this:Lcom/android/internal/app/ProcessMap;,"Lcom/android/internal/app/ProcessMap<TE;>;"
    .local p3, value:Ljava/lang/Object;,"TE;"
    iget-object v1, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 34
    .local v0, uids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<TE;>;"
    if-nez v0, :cond_0

    .line 35
    new-instance v0, Landroid/util/SparseArray;

    .end local v0           #uids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<TE;>;"
    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 36
    .restart local v0       #uids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<TE;>;"
    iget-object v1, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    :cond_0
    invoke-virtual {v0, p2, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 39
    return-object p3
.end method

.method public remove(Ljava/lang/String;I)V
    .locals 2
    .parameter "name"
    .parameter "uid"

    .prologue
    .line 43
    .local p0, this:Lcom/android/internal/app/ProcessMap;,"Lcom/android/internal/app/ProcessMap<TE;>;"
    iget-object v1, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 44
    .local v0, uids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<TE;>;"
    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->remove(I)V

    .line 46
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 47
    iget-object v1, p0, Lcom/android/internal/app/ProcessMap;->mMap:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    return-void
.end method
