; ModuleID = 'c/src/log_parser.c'
source_filename = "c/src/log_parser.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.LogParserData = type { i32, ptr, i64, i32, [13 x ptr], [13 x ptr] }

@.str = private unnamed_addr constant [12 x i8] c"lines_count\00", align 1
@PATTERNS = internal global [13 x ptr] [ptr @.str.36, ptr @.str.37, ptr @.str.38, ptr @.str.39, ptr @.str.40, ptr @.str.41, ptr @.str.42, ptr @.str.43, ptr @.str.44, ptr @.str.45, ptr @.str.46, ptr @.str.47, ptr @.str.48], align 16
@PATTERN_NAMES = internal global [13 x ptr] [ptr @.str.49, ptr @.str.50, ptr @.str.51, ptr @.str.52, ptr @.str.53, ptr @.str.54, ptr @.str.55, ptr @.str.56, ptr @.str.57, ptr @.str.58, ptr @.str.59, ptr @.str.60, ptr @.str.61], align 16
@.str.1 = private unnamed_addr constant [15 x i8] c"Etc::LogParser\00", align 1
@init_ips.initialized = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [13 x i8] c"192.168.1.%d\00", align 1
@IPS = internal global [255 x ptr] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [115 x i8] c"%s - - [%d/Oct/2023:%d:55:36 +0000] \22%s /login?email=%s%d@%s&password=secret%d HTTP/1.1\22 %d 2326 \22http://%s\22 \22%s\22\0A\00", align 1
@METHODS = internal global [4 x ptr] [ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@USERS = internal global [8 x ptr] [ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17, ptr @.str.18, ptr @.str.19], align 16
@DOMAINS = internal global [6 x ptr] [ptr @.str.20, ptr @.str.21, ptr @.str.22, ptr @.str.23, ptr @.str.24, ptr @.str.25], align 16
@STATUSES = internal global [11 x i32] [i32 200, i32 201, i32 301, i32 302, i32 400, i32 401, i32 403, i32 404, i32 500, i32 502, i32 503], align 16
@AGENTS = internal global [4 x ptr] [ptr @.str.26, ptr @.str.27, ptr @.str.28, ptr @.str.29], align 16
@.str.4 = private unnamed_addr constant [13 x i8] c"abcdef123456\00", align 1
@.str.5 = private unnamed_addr constant [95 x i8] c"%s - - [%d/Oct/2023:%d:55:36 +0000] \22%s /api/data?token=%s HTTP/1.1\22 %d 2326 \22http://%s\22 \22%s\22\0A\00", align 1
@.str.6 = private unnamed_addr constant [109 x i8] c"%s - - [%d/Oct/2023:%d:55:36 +0000] \22%s /user/profile?session_id=sess_%x HTTP/1.1\22 %d 2326 \22http://%s\22 \22%s\22\0A\00", align 1
@.str.7 = private unnamed_addr constant [79 x i8] c"%s - - [%d/Oct/2023:%d:55:36 +0000] \22%s %s HTTP/1.1\22 %d 2326 \22http://%s\22 \22%s\22\0A\00", align 1
@PATHS = internal global [6 x ptr] [ptr @.str.30, ptr @.str.31, ptr @.str.32, ptr @.str.33, ptr @.str.34, ptr @.str.35], align 16
@.str.8 = private unnamed_addr constant [4 x i8] c"GET\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"POST\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"PUT\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"DELETE\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"john\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"jane\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"alex\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"sarah\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"mike\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"anna\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"david\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"elena\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"example.com\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"gmail.com\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"yahoo.com\00", align 1
@.str.23 = private unnamed_addr constant [12 x i8] c"hotmail.com\00", align 1
@.str.24 = private unnamed_addr constant [12 x i8] c"company.org\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"mail.ru\00", align 1
@.str.26 = private unnamed_addr constant [12 x i8] c"Mozilla/5.0\00", align 1
@.str.27 = private unnamed_addr constant [14 x i8] c"Googlebot/2.1\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"curl/7.68.0\00", align 1
@.str.29 = private unnamed_addr constant [12 x i8] c"scanner/2.0\00", align 1
@.str.30 = private unnamed_addr constant [12 x i8] c"/index.html\00", align 1
@.str.31 = private unnamed_addr constant [11 x i8] c"/api/users\00", align 1
@.str.32 = private unnamed_addr constant [7 x i8] c"/admin\00", align 1
@.str.33 = private unnamed_addr constant [17 x i8] c"/images/logo.png\00", align 1
@.str.34 = private unnamed_addr constant [12 x i8] c"/etc/passwd\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"/wp-admin/setup.php\00", align 1
@.str.36 = private unnamed_addr constant [28 x i8] c" [5][0-9]{2} | [4][0-9]{2} \00", align 1
@.str.37 = private unnamed_addr constant [59 x i8] c"(?i)bot|crawler|scanner|spider|indexing|crawl|robot|spider\00", align 1
@.str.38 = private unnamed_addr constant [30 x i8] c"(?i)etc/passwd|wp-admin|\\.\\./\00", align 1
@.str.39 = private unnamed_addr constant [18 x i8] c"\\d+\\.\\d+\\.\\d+\\.35\00", align 1
@.str.40 = private unnamed_addr constant [13 x i8] c"/api/[^ \22 ]+\00", align 1
@.str.41 = private unnamed_addr constant [16 x i8] c"POST [^ ]* HTTP\00", align 1
@.str.42 = private unnamed_addr constant [19 x i8] c"(?i)/login|/signin\00", align 1
@.str.43 = private unnamed_addr constant [17 x i8] c"(?i)get|post|put\00", align 1
@.str.44 = private unnamed_addr constant [47 x i8] c"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\00", align 1
@.str.45 = private unnamed_addr constant [18 x i8] c"password=[^&\\s\22]+\00", align 1
@.str.46 = private unnamed_addr constant [36 x i8] c"token=[^&\\s\22]+|api[_-]?key=[^&\\s\22]+\00", align 1
@.str.47 = private unnamed_addr constant [24 x i8] c"session[_-]?id=[^&\\s\22]+\00", align 1
@.str.48 = private unnamed_addr constant [40 x i8] c"\\[\\d+/\\w+/\\d+:1[3-7]:\\d+:\\d+ [+\\-]\\d+\\]\00", align 1
@.str.49 = private unnamed_addr constant [7 x i8] c"errors\00", align 1
@.str.50 = private unnamed_addr constant [5 x i8] c"bots\00", align 1
@.str.51 = private unnamed_addr constant [11 x i8] c"suspicious\00", align 1
@.str.52 = private unnamed_addr constant [4 x i8] c"ips\00", align 1
@.str.53 = private unnamed_addr constant [10 x i8] c"api_calls\00", align 1
@.str.54 = private unnamed_addr constant [14 x i8] c"post_requests\00", align 1
@.str.55 = private unnamed_addr constant [14 x i8] c"auth_attempts\00", align 1
@.str.56 = private unnamed_addr constant [8 x i8] c"methods\00", align 1
@.str.57 = private unnamed_addr constant [7 x i8] c"emails\00", align 1
@.str.58 = private unnamed_addr constant [10 x i8] c"passwords\00", align 1
@.str.59 = private unnamed_addr constant [7 x i8] c"tokens\00", align 1
@.str.60 = private unnamed_addr constant [9 x i8] c"sessions\00", align 1
@.str.61 = private unnamed_addr constant [11 x i8] c"peak_hours\00", align 1

define dso_local void @LogParser_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 11
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %3, align 8
  call void @init_ips()
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.LogParserData, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %24

18:                                               ; preds = %1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.LogParserData, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21)
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.LogParserData, ptr %22, i32 0, i32 1
  store ptr null, ptr %23, align 8
  br label %24

24:                                               ; preds = %18, %1
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = call i64 @Helper_config_i64(ptr noundef %27, ptr noundef @.str)
  %29 = trunc i64 %28 to i32
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.LogParserData, ptr %30, i32 0, i32 0
  store i32 %29, ptr %31, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.LogParserData, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = mul nsw i32 %34, 200
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  store i64 %37, ptr %4, align 8
  %38 = load i64, ptr %4, align 8
  %39 = call noalias ptr @malloc(i64 noundef %38)
  store ptr %39, ptr %5, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %43, label %42

42:                                               ; preds = %24
  br label %111

43:                                               ; preds = %24
  store i64 0, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %44

44:                                               ; preds = %53, %43
  %45 = load i32, ptr %7, align 4
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.LogParserData, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = icmp slt i32 %45, %48
  br i1 %49, label %50, label %56

50:                                               ; preds = %44
  %51 = load ptr, ptr %5, align 8
  %52 = load i32, ptr %7, align 4
  call void @generate_log_line(ptr noundef %51, ptr noundef %6, i32 noundef %52)
  br label %53

53:                                               ; preds = %50
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %7, align 4
  br label %44, !llvm.loop !6

56:                                               ; preds = %44
  %57 = load ptr, ptr %5, align 8
  %58 = load i64, ptr %6, align 8
  %59 = getelementptr inbounds nuw i8, ptr %57, i64 %58
  store i8 0, ptr %59, align 1
  %60 = load ptr, ptr %5, align 8
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds nuw %struct.LogParserData, ptr %61, i32 0, i32 1
  store ptr %60, ptr %62, align 8
  %63 = load i64, ptr %6, align 8
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds nuw %struct.LogParserData, ptr %64, i32 0, i32 2
  store i64 %63, ptr %65, align 8
  store i32 0, ptr %8, align 4
  br label %66

66:                                               ; preds = %108, %56
  %67 = load i32, ptr %8, align 4
  %68 = icmp slt i32 %67, 13
  br i1 %68, label %69, label %111

69:                                               ; preds = %66
  %70 = load i32, ptr %8, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [13 x ptr], ptr @PATTERNS, i64 0, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = call ptr @pcre2_compile_8(ptr noundef %73, i64 noundef -1, i32 noundef 1074266112, ptr noundef %9, ptr noundef %10, ptr noundef null)
  %75 = load ptr, ptr %3, align 8
  %76 = getelementptr inbounds nuw %struct.LogParserData, ptr %75, i32 0, i32 4
  %77 = load i32, ptr %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [13 x ptr], ptr %76, i64 0, i64 %78
  store ptr %74, ptr %79, align 8
  %80 = load ptr, ptr %3, align 8
  %81 = getelementptr inbounds nuw %struct.LogParserData, ptr %80, i32 0, i32 4
  %82 = load i32, ptr %8, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [13 x ptr], ptr %81, i64 0, i64 %83
  %85 = load ptr, ptr %84, align 8
  %86 = icmp ne ptr %85, null
  br i1 %86, label %87, label %107

87:                                               ; preds = %69
  %88 = load ptr, ptr %3, align 8
  %89 = getelementptr inbounds nuw %struct.LogParserData, ptr %88, i32 0, i32 4
  %90 = load i32, ptr %8, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [13 x ptr], ptr %89, i64 0, i64 %91
  %93 = load ptr, ptr %92, align 8
  %94 = call i32 @pcre2_jit_compile_8(ptr noundef %93, i32 noundef 1)
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds nuw %struct.LogParserData, ptr %95, i32 0, i32 4
  %97 = load i32, ptr %8, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [13 x ptr], ptr %96, i64 0, i64 %98
  %100 = load ptr, ptr %99, align 8
  %101 = call ptr @pcre2_match_data_create_from_pattern_8(ptr noundef %100, ptr noundef null)
  %102 = load ptr, ptr %3, align 8
  %103 = getelementptr inbounds nuw %struct.LogParserData, ptr %102, i32 0, i32 5
  %104 = load i32, ptr %8, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [13 x ptr], ptr %103, i64 0, i64 %105
  store ptr %101, ptr %106, align 8
  br label %107

107:                                              ; preds = %87, %69
  br label %108

108:                                              ; preds = %107
  %109 = load i32, ptr %8, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %8, align 4
  br label %66, !llvm.loop !8

111:                                              ; preds = %42, %66
  ret void
}

define internal void @init_ips() {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = load i32, ptr @init_ips.initialized, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  br label %24

6:                                                ; preds = %0
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %20, %6
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 255
  br i1 %9, label %10, label %23

10:                                               ; preds = %7
  %11 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %11, ptr %2, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load i32, ptr %1, align 4
  %14 = add nsw i32 %13, 1
  %15 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %12, i64 noundef 16, ptr noundef @.str.2, i32 noundef %14)
  %16 = load ptr, ptr %2, align 8
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [255 x ptr], ptr @IPS, i64 0, i64 %18
  store ptr %16, ptr %19, align 8
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %1, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %1, align 4
  br label %7, !llvm.loop !9

23:                                               ; preds = %7
  store i32 1, ptr @init_ips.initialized, align 4
  br label %24

24:                                               ; preds = %23, %5
  ret void
}

declare void @free(ptr noundef)

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define internal void @generate_log_line(ptr noundef %0, ptr noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [200 x i8], align 16
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %6, align 4
  %10 = srem i32 %9, 3
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %65

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr inbounds nuw i8, ptr %13, i64 %15
  %17 = load i32, ptr %6, align 4
  %18 = srem i32 %17, 255
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [255 x ptr], ptr @IPS, i64 0, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %6, align 4
  %23 = srem i32 %22, 31
  %24 = load i32, ptr %6, align 4
  %25 = srem i32 %24, 60
  %26 = load i32, ptr %6, align 4
  %27 = srem i32 %26, 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [4 x ptr], ptr @METHODS, i64 0, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %6, align 4
  %32 = srem i32 %31, 8
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [8 x ptr], ptr @USERS, i64 0, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = load i32, ptr %6, align 4
  %37 = srem i32 %36, 100
  %38 = load i32, ptr %6, align 4
  %39 = srem i32 %38, 6
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [6 x ptr], ptr @DOMAINS, i64 0, i64 %40
  %42 = load ptr, ptr %41, align 8
  %43 = load i32, ptr %6, align 4
  %44 = srem i32 %43, 10000
  %45 = load i32, ptr %6, align 4
  %46 = srem i32 %45, 11
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [11 x i32], ptr @STATUSES, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %6, align 4
  %51 = srem i32 %50, 6
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [6 x ptr], ptr @DOMAINS, i64 0, i64 %52
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %6, align 4
  %56 = srem i32 %55, 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [4 x ptr], ptr @AGENTS, i64 0, i64 %57
  %59 = load ptr, ptr %58, align 8
  %60 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %16, ptr noundef @.str.3, ptr noundef %21, i32 noundef %23, i32 noundef %25, ptr noundef %30, ptr noundef %35, i32 noundef %37, ptr noundef %42, i32 noundef %44, i32 noundef %49, ptr noundef %54, ptr noundef %59)
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %5, align 8
  %63 = load i64, ptr %62, align 8
  %64 = add i64 %63, %61
  store i64 %64, ptr %62, align 8
  br label %213

65:                                               ; preds = %3
  %66 = load i32, ptr %6, align 4
  %67 = srem i32 %66, 5
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %122

69:                                               ; preds = %65
  call void @llvm.memset.p0.i64(ptr align 16 %7, i8 0, i64 200, i1 false)
  store i32 0, ptr %8, align 4
  br label %70

70:                                               ; preds = %79, %69
  %71 = load i32, ptr %8, align 4
  %72 = load i32, ptr %6, align 4
  %73 = srem i32 %72, 3
  %74 = add nsw i32 %73, 1
  %75 = icmp slt i32 %71, %74
  br i1 %75, label %76, label %82

76:                                               ; preds = %70
  %77 = getelementptr inbounds [200 x i8], ptr %7, i64 0, i64 0
  %78 = call ptr @strcat(ptr noundef %77, ptr noundef @.str.4)
  br label %79

79:                                               ; preds = %76
  %80 = load i32, ptr %8, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %8, align 4
  br label %70, !llvm.loop !10

82:                                               ; preds = %70
  %83 = load ptr, ptr %4, align 8
  %84 = load ptr, ptr %5, align 8
  %85 = load i64, ptr %84, align 8
  %86 = getelementptr inbounds nuw i8, ptr %83, i64 %85
  %87 = load i32, ptr %6, align 4
  %88 = srem i32 %87, 255
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [255 x ptr], ptr @IPS, i64 0, i64 %89
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %6, align 4
  %93 = srem i32 %92, 31
  %94 = load i32, ptr %6, align 4
  %95 = srem i32 %94, 60
  %96 = load i32, ptr %6, align 4
  %97 = srem i32 %96, 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [4 x ptr], ptr @METHODS, i64 0, i64 %98
  %100 = load ptr, ptr %99, align 8
  %101 = getelementptr inbounds [200 x i8], ptr %7, i64 0, i64 0
  %102 = load i32, ptr %6, align 4
  %103 = srem i32 %102, 11
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [11 x i32], ptr @STATUSES, i64 0, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load i32, ptr %6, align 4
  %108 = srem i32 %107, 6
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [6 x ptr], ptr @DOMAINS, i64 0, i64 %109
  %111 = load ptr, ptr %110, align 8
  %112 = load i32, ptr %6, align 4
  %113 = srem i32 %112, 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [4 x ptr], ptr @AGENTS, i64 0, i64 %114
  %116 = load ptr, ptr %115, align 8
  %117 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %86, ptr noundef @.str.5, ptr noundef %91, i32 noundef %93, i32 noundef %95, ptr noundef %100, ptr noundef %101, i32 noundef %106, ptr noundef %111, ptr noundef %116)
  %118 = sext i32 %117 to i64
  %119 = load ptr, ptr %5, align 8
  %120 = load i64, ptr %119, align 8
  %121 = add i64 %120, %118
  store i64 %121, ptr %119, align 8
  br label %212

122:                                              ; preds = %65
  %123 = load i32, ptr %6, align 4
  %124 = srem i32 %123, 7
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %167

126:                                              ; preds = %122
  %127 = load ptr, ptr %4, align 8
  %128 = load ptr, ptr %5, align 8
  %129 = load i64, ptr %128, align 8
  %130 = getelementptr inbounds nuw i8, ptr %127, i64 %129
  %131 = load i32, ptr %6, align 4
  %132 = srem i32 %131, 255
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [255 x ptr], ptr @IPS, i64 0, i64 %133
  %135 = load ptr, ptr %134, align 8
  %136 = load i32, ptr %6, align 4
  %137 = srem i32 %136, 31
  %138 = load i32, ptr %6, align 4
  %139 = srem i32 %138, 60
  %140 = load i32, ptr %6, align 4
  %141 = srem i32 %140, 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [4 x ptr], ptr @METHODS, i64 0, i64 %142
  %144 = load ptr, ptr %143, align 8
  %145 = load i32, ptr %6, align 4
  %146 = mul nsw i32 %145, 12345
  %147 = load i32, ptr %6, align 4
  %148 = srem i32 %147, 11
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [11 x i32], ptr @STATUSES, i64 0, i64 %149
  %151 = load i32, ptr %150, align 4
  %152 = load i32, ptr %6, align 4
  %153 = srem i32 %152, 6
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [6 x ptr], ptr @DOMAINS, i64 0, i64 %154
  %156 = load ptr, ptr %155, align 8
  %157 = load i32, ptr %6, align 4
  %158 = srem i32 %157, 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [4 x ptr], ptr @AGENTS, i64 0, i64 %159
  %161 = load ptr, ptr %160, align 8
  %162 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %130, ptr noundef @.str.6, ptr noundef %135, i32 noundef %137, i32 noundef %139, ptr noundef %144, i32 noundef %146, i32 noundef %151, ptr noundef %156, ptr noundef %161)
  %163 = sext i32 %162 to i64
  %164 = load ptr, ptr %5, align 8
  %165 = load i64, ptr %164, align 8
  %166 = add i64 %165, %163
  store i64 %166, ptr %164, align 8
  br label %211

167:                                              ; preds = %122
  %168 = load ptr, ptr %4, align 8
  %169 = load ptr, ptr %5, align 8
  %170 = load i64, ptr %169, align 8
  %171 = getelementptr inbounds nuw i8, ptr %168, i64 %170
  %172 = load i32, ptr %6, align 4
  %173 = srem i32 %172, 255
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [255 x ptr], ptr @IPS, i64 0, i64 %174
  %176 = load ptr, ptr %175, align 8
  %177 = load i32, ptr %6, align 4
  %178 = srem i32 %177, 31
  %179 = load i32, ptr %6, align 4
  %180 = srem i32 %179, 60
  %181 = load i32, ptr %6, align 4
  %182 = srem i32 %181, 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [4 x ptr], ptr @METHODS, i64 0, i64 %183
  %185 = load ptr, ptr %184, align 8
  %186 = load i32, ptr %6, align 4
  %187 = srem i32 %186, 6
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [6 x ptr], ptr @PATHS, i64 0, i64 %188
  %190 = load ptr, ptr %189, align 8
  %191 = load i32, ptr %6, align 4
  %192 = srem i32 %191, 11
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [11 x i32], ptr @STATUSES, i64 0, i64 %193
  %195 = load i32, ptr %194, align 4
  %196 = load i32, ptr %6, align 4
  %197 = srem i32 %196, 6
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [6 x ptr], ptr @DOMAINS, i64 0, i64 %198
  %200 = load ptr, ptr %199, align 8
  %201 = load i32, ptr %6, align 4
  %202 = srem i32 %201, 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [4 x ptr], ptr @AGENTS, i64 0, i64 %203
  %205 = load ptr, ptr %204, align 8
  %206 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %171, ptr noundef @.str.7, ptr noundef %176, i32 noundef %178, i32 noundef %180, ptr noundef %185, ptr noundef %190, i32 noundef %195, ptr noundef %200, ptr noundef %205)
  %207 = sext i32 %206 to i64
  %208 = load ptr, ptr %5, align 8
  %209 = load i64, ptr %208, align 8
  %210 = add i64 %209, %207
  store i64 %210, ptr %208, align 8
  br label %211

211:                                              ; preds = %167, %126
  br label %212

212:                                              ; preds = %211, %82
  br label %213

213:                                              ; preds = %212, %12
  ret void
}

declare ptr @pcre2_compile_8(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef)

declare i32 @pcre2_jit_compile_8(ptr noundef, i32 noundef)

declare ptr @pcre2_match_data_create_from_pattern_8(ptr noundef, ptr noundef)

define dso_local void @LogParser_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [13 x i32], align 16
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %15 = load i32, ptr %4, align 4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 11
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 52, i1 false)
  store i32 0, ptr %7, align 4
  br label %19

19:                                               ; preds = %80, %2
  %20 = load i32, ptr %7, align 4
  %21 = icmp slt i32 %20, 13
  br i1 %21, label %22, label %83

22:                                               ; preds = %19
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.LogParserData, ptr %23, i32 0, i32 4
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [13 x ptr], ptr %24, i64 0, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %31, label %30

30:                                               ; preds = %22
  br label %80

31:                                               ; preds = %22
  store i64 0, ptr %8, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw %struct.LogParserData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %9, align 8
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds nuw %struct.LogParserData, ptr %35, i32 0, i32 2
  %37 = load i64, ptr %36, align 8
  store i64 %37, ptr %10, align 8
  br label %38

38:                                               ; preds = %31, %78
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.LogParserData, ptr %39, i32 0, i32 4
  %41 = load i32, ptr %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [13 x ptr], ptr %40, i64 0, i64 %42
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = load i64, ptr %10, align 8
  %47 = load i64, ptr %8, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds nuw %struct.LogParserData, ptr %48, i32 0, i32 5
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [13 x ptr], ptr %49, i64 0, i64 %51
  %53 = load ptr, ptr %52, align 8
  %54 = call i32 @pcre2_jit_match_8(ptr noundef %44, ptr noundef %45, i64 noundef %46, i64 noundef %47, i32 noundef 0, ptr noundef %53, ptr noundef null)
  store i32 %54, ptr %11, align 4
  %55 = load i32, ptr %11, align 4
  %56 = icmp slt i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %38
  br label %79

58:                                               ; preds = %38
  %59 = load i32, ptr %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [13 x i32], ptr %6, i64 0, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %61, align 4
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds nuw %struct.LogParserData, ptr %64, i32 0, i32 5
  %66 = load i32, ptr %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [13 x ptr], ptr %65, i64 0, i64 %67
  %69 = load ptr, ptr %68, align 8
  %70 = call ptr @pcre2_get_ovector_pointer_8(ptr noundef %69)
  store ptr %70, ptr %12, align 8
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr inbounds i64, ptr %71, i64 1
  %73 = load i64, ptr %72, align 8
  store i64 %73, ptr %8, align 8
  %74 = load i64, ptr %8, align 8
  %75 = load i64, ptr %10, align 8
  %76 = icmp uge i64 %74, %75
  br i1 %76, label %77, label %78

77:                                               ; preds = %58
  br label %79

78:                                               ; preds = %58
  br label %38

79:                                               ; preds = %77, %57
  br label %80

80:                                               ; preds = %79, %30
  %81 = load i32, ptr %7, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %7, align 4
  br label %19, !llvm.loop !11

83:                                               ; preds = %19
  store i32 0, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %84

84:                                               ; preds = %94, %83
  %85 = load i32, ptr %14, align 4
  %86 = icmp slt i32 %85, 13
  br i1 %86, label %87, label %97

87:                                               ; preds = %84
  %88 = load i32, ptr %14, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [13 x i32], ptr %6, i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %13, align 4
  %93 = add i32 %92, %91
  store i32 %93, ptr %13, align 4
  br label %94

94:                                               ; preds = %87
  %95 = load i32, ptr %14, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %14, align 4
  br label %84, !llvm.loop !12

97:                                               ; preds = %84
  %98 = load i32, ptr %13, align 4
  %99 = load ptr, ptr %5, align 8
  %100 = getelementptr inbounds nuw %struct.LogParserData, ptr %99, i32 0, i32 3
  %101 = load i32, ptr %100, align 8
  %102 = add i32 %101, %98
  store i32 %102, ptr %100, align 8
  ret void
}

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare i32 @pcre2_jit_match_8(ptr noundef, ptr noundef, i64 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef)

declare ptr @pcre2_get_ovector_pointer_8(ptr noundef)

define dso_local i32 @LogParser_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.LogParserData, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @LogParser_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.LogParserData, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %18

12:                                               ; preds = %1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.LogParserData, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.LogParserData, ptr %16, i32 0, i32 1
  store ptr null, ptr %17, align 8
  br label %18

18:                                               ; preds = %12, %1
  store i32 0, ptr %4, align 4
  br label %19

19:                                               ; preds = %63, %18
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %20, 13
  br i1 %21, label %22, label %66

22:                                               ; preds = %19
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.LogParserData, ptr %23, i32 0, i32 4
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [13 x ptr], ptr %24, i64 0, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %42

30:                                               ; preds = %22
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.LogParserData, ptr %31, i32 0, i32 4
  %33 = load i32, ptr %4, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [13 x ptr], ptr %32, i64 0, i64 %34
  %36 = load ptr, ptr %35, align 8
  call void @pcre2_code_free_8(ptr noundef %36)
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.LogParserData, ptr %37, i32 0, i32 4
  %39 = load i32, ptr %4, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [13 x ptr], ptr %38, i64 0, i64 %40
  store ptr null, ptr %41, align 8
  br label %42

42:                                               ; preds = %30, %22
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.LogParserData, ptr %43, i32 0, i32 5
  %45 = load i32, ptr %4, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [13 x ptr], ptr %44, i64 0, i64 %46
  %48 = load ptr, ptr %47, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %62

50:                                               ; preds = %42
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.LogParserData, ptr %51, i32 0, i32 5
  %53 = load i32, ptr %4, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [13 x ptr], ptr %52, i64 0, i64 %54
  %56 = load ptr, ptr %55, align 8
  call void @pcre2_match_data_free_8(ptr noundef %56)
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.LogParserData, ptr %57, i32 0, i32 5
  %59 = load i32, ptr %4, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [13 x ptr], ptr %58, i64 0, i64 %60
  store ptr null, ptr %61, align 8
  br label %62

62:                                               ; preds = %50, %42
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %4, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %4, align 4
  br label %19, !llvm.loop !13

66:                                               ; preds = %19
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds nuw %struct.LogParserData, ptr %67, i32 0, i32 2
  store i64 0, ptr %68, align 8
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds nuw %struct.LogParserData, ptr %69, i32 0, i32 3
  store i32 0, ptr %70, align 8
  ret void
}

declare void @pcre2_code_free_8(ptr noundef)

declare void @pcre2_match_data_free_8(ptr noundef)

define dso_local ptr @LogParser_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %4, ptr %1, align 8
  %5 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 240)
  store ptr %5, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %20, %0
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 13
  br i1 %8, label %9, label %23

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.LogParserData, ptr %10, i32 0, i32 4
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [13 x ptr], ptr %11, i64 0, i64 %13
  store ptr null, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.LogParserData, ptr %15, i32 0, i32 5
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [13 x ptr], ptr %16, i64 0, i64 %18
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %9
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %6, !llvm.loop !14

23:                                               ; preds = %6
  %24 = load ptr, ptr %2, align 8
  %25 = load ptr, ptr %1, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 11
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %1, align 8
  %28 = getelementptr inbounds nuw %struct.Benchmark, ptr %27, i32 0, i32 3
  store ptr @LogParser_prepare, ptr %28, align 8
  %29 = load ptr, ptr %1, align 8
  %30 = getelementptr inbounds nuw %struct.Benchmark, ptr %29, i32 0, i32 4
  store ptr @LogParser_run, ptr %30, align 8
  %31 = load ptr, ptr %1, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 7
  store ptr @LogParser_checksum, ptr %32, align 8
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr inbounds nuw %struct.Benchmark, ptr %33, i32 0, i32 10
  store ptr @LogParser_cleanup, ptr %34, align 8
  %35 = load ptr, ptr %1, align 8
  ret ptr %35
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare i32 @sprintf(ptr noundef, ptr noundef, ...)

declare ptr @strcat(ptr noundef, ptr noundef)


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
