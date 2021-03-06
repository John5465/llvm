; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512bw,+avx512vl | FileCheck %s

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_test_epi8_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_test_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpneqb %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp ne <16 x i8> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_mask_test_epi8_mask(i16 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_mask_test_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpneqb %xmm1, %xmm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp ne <16 x i8> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_test_epi16_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_test_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpneqw %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AL<def> %AL<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp ne <8 x i16> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_test_epi16_mask(i8 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_mask_test_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpneqw %xmm1, %xmm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AL<def> %AL<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp ne <8 x i16> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_testn_epi8_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_testn_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpeqb %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp eq <16 x i8> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm_mask_testn_epi8_mask(i16 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_mask_testn_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpeqb %xmm1, %xmm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <16 x i8>
  %1 = icmp eq <16 x i8> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_testn_epi16_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_testn_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpeqw %xmm1, %xmm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AL<def> %AL<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp eq <8 x i16> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_testn_epi16_mask(i8 zeroext %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm_mask_testn_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %xmm0, %xmm1, %xmm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpeqw %xmm1, %xmm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AL<def> %AL<kill> %EAX<kill>
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <8 x i16>
  %1 = icmp eq <8 x i16> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_test_epi8_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_test_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpneqb %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp ne <32 x i8> %0, zeroinitializer
  %2 = bitcast <32 x i1> %1 to i32
  ret i32 %2
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_mask_test_epi8_mask(i32 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_mask_test_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpneqb %ymm1, %ymm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp ne <32 x i8> %0, zeroinitializer
  %2 = bitcast i32 %__U to <32 x i1>
  %3 = and <32 x i1> %1, %2
  %4 = bitcast <32 x i1> %3 to i32
  ret i32 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_test_epi16_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_test_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpneqw %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp ne <16 x i16> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_mask_test_epi16_mask(i16 zeroext %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_mask_test_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpneqw %ymm1, %ymm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp ne <16 x i16> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_testn_epi8_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_testn_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpeqb %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp eq <32 x i8> %0, zeroinitializer
  %2 = bitcast <32 x i1> %1 to i32
  ret i32 %2
}

; Function Attrs: norecurse nounwind readnone
define i32 @TEST_mm256_mask_testn_epi8_mask(i32 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_mask_testn_epi8_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpeqb %ymm1, %ymm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <32 x i8>
  %1 = icmp eq <32 x i8> %0, zeroinitializer
  %2 = bitcast i32 %__U to <32 x i1>
  %3 = and <32 x i1> %1, %2
  %4 = bitcast <32 x i1> %3 to i32
  ret i32 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_testn_epi16_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_testn_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpcmpeqw %ymm1, %ymm0, %k0
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp eq <16 x i16> %0, zeroinitializer
  %2 = bitcast <16 x i1> %1 to i16
  ret i16 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i16 @TEST_mm256_mask_testn_epi16_mask(i16 zeroext %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; CHECK-LABEL: TEST_mm256_mask_testn_epi16_mask:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vpand %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcmpeqw %ymm1, %ymm0, %k0 {%k1}
; CHECK-NEXT:    kmovd %k0, %eax
; CHECK-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <16 x i16>
  %1 = icmp eq <16 x i16> %0, zeroinitializer
  %2 = bitcast i16 %__U to <16 x i1>
  %3 = and <16 x i1> %1, %2
  %4 = bitcast <16 x i1> %3 to i16
  ret i16 %4
}


