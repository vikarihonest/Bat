
    const-string v0, "batterymanager"

    invoke-virtual {p0, v0}, Lcom/vikari/mod2/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/BatteryManager;

   
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/BatteryManager;->getIntProperty(I)I

    move-result v0

   
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    
    :try_start_22
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    const-string v5, "/storage/emulated/0/112"

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_35
    .catchall {:try_start_22 .. :try_end_35} :catchall_46

    
    :try_start_35
    invoke-virtual {v2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_53
    .catchall {:try_start_35 .. :try_end_38} :catchall_3e

    :goto_38
    if-eqz v2, :cond_c

    :try_start_3a
    invoke-interface {v2}, Ljava/lang/AutoCloseable;->close()V
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_3e

    goto :goto_c

    :catchall_3e
    move-exception v0

    move-object v1, v0

    if-eqz v2, :cond_45

    :try_start_42
    invoke-interface {v2}, Ljava/lang/AutoCloseable;->close()V

    :cond_45
    throw v1
    :try_end_46
    .catchall {:try_start_42 .. :try_end_46} :catchall_46

    :catchall_46
    move-exception v0

    if-nez v1, :cond_4c

    :goto_49
    :try_start_49
    throw v0

    :catch_4a
    move-exception v0

    goto :goto_c

    :cond_4c
    if-eq v1, v0, :cond_51

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_51
    .catch Ljava/io/FileNotFoundException; {:try_start_49 .. :try_end_51} :catch_4a

    :cond_51
    move-object v0, v1

    goto :goto_49

    :catch_53
    move-exception v0

    goto :goto_38
