
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 e0 0b 00 	movl   $0xbe0,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 a0 03 00 00       	call   3c3 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 ef 08 00 	movl   $0x8ef,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 e7 04 00 00       	call   523 <printf>
      exit();
  3c:	e8 62 03 00 00       	call   3a3 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 e0 0b 00 	movl   $0xbe0,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 5f 03 00 00       	call   3bb <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 01 09 00 	movl   $0x901,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 a4 04 00 00       	call   523 <printf>
    exit();
  7f:	e8 1f 03 00 00       	call   3a3 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 fd 02 00 00       	call   3a3 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 11 03 00 00       	call   3e3 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 12 09 00 	movl   $0x912,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 1c 04 00 00       	call   523 <printf>
      exit();
 107:	e8 97 02 00 00       	call   3a3 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 a7 02 00 00       	call   3cb <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 68 02 00 00       	call   3a3 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 44 01 00 00       	call   3bb <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 07 01 00 00       	call   3e3 <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 fd 00 00 00       	call   3fb <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 bf 00 00 00       	call   3cb <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 39b:	b8 01 00 00 00       	mov    $0x1,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <exit>:
SYSCALL(exit)
 3a3:	b8 02 00 00 00       	mov    $0x2,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <wait>:
SYSCALL(wait)
 3ab:	b8 03 00 00 00       	mov    $0x3,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <pipe>:
SYSCALL(pipe)
 3b3:	b8 04 00 00 00       	mov    $0x4,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <read>:
SYSCALL(read)
 3bb:	b8 05 00 00 00       	mov    $0x5,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <write>:
SYSCALL(write)
 3c3:	b8 10 00 00 00       	mov    $0x10,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <close>:
SYSCALL(close)
 3cb:	b8 15 00 00 00       	mov    $0x15,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <kill>:
SYSCALL(kill)
 3d3:	b8 06 00 00 00       	mov    $0x6,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <exec>:
SYSCALL(exec)
 3db:	b8 07 00 00 00       	mov    $0x7,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <open>:
SYSCALL(open)
 3e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <mknod>:
SYSCALL(mknod)
 3eb:	b8 11 00 00 00       	mov    $0x11,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <unlink>:
SYSCALL(unlink)
 3f3:	b8 12 00 00 00       	mov    $0x12,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <fstat>:
SYSCALL(fstat)
 3fb:	b8 08 00 00 00       	mov    $0x8,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <link>:
SYSCALL(link)
 403:	b8 13 00 00 00       	mov    $0x13,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <mkdir>:
SYSCALL(mkdir)
 40b:	b8 14 00 00 00       	mov    $0x14,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <chdir>:
SYSCALL(chdir)
 413:	b8 09 00 00 00       	mov    $0x9,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <dup>:
SYSCALL(dup)
 41b:	b8 0a 00 00 00       	mov    $0xa,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <getpid>:
SYSCALL(getpid)
 423:	b8 0b 00 00 00       	mov    $0xb,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <sbrk>:
SYSCALL(sbrk)
 42b:	b8 0c 00 00 00       	mov    $0xc,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <sleep>:
SYSCALL(sleep)
 433:	b8 0d 00 00 00       	mov    $0xd,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <uptime>:
SYSCALL(uptime)
 43b:	b8 0e 00 00 00       	mov    $0xe,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	83 ec 18             	sub    $0x18,%esp
 449:	8b 45 0c             	mov    0xc(%ebp),%eax
 44c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 44f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 456:	00 
 457:	8d 45 f4             	lea    -0xc(%ebp),%eax
 45a:	89 44 24 04          	mov    %eax,0x4(%esp)
 45e:	8b 45 08             	mov    0x8(%ebp),%eax
 461:	89 04 24             	mov    %eax,(%esp)
 464:	e8 5a ff ff ff       	call   3c3 <write>
}
 469:	c9                   	leave  
 46a:	c3                   	ret    

0000046b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
 46e:	56                   	push   %esi
 46f:	53                   	push   %ebx
 470:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 473:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 47a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47e:	74 17                	je     497 <printint+0x2c>
 480:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 484:	79 11                	jns    497 <printint+0x2c>
    neg = 1;
 486:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 48d:	8b 45 0c             	mov    0xc(%ebp),%eax
 490:	f7 d8                	neg    %eax
 492:	89 45 ec             	mov    %eax,-0x14(%ebp)
 495:	eb 06                	jmp    49d <printint+0x32>
  } else {
    x = xx;
 497:	8b 45 0c             	mov    0xc(%ebp),%eax
 49a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 49d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a7:	8d 41 01             	lea    0x1(%ecx),%eax
 4aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ad:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b3:	ba 00 00 00 00       	mov    $0x0,%edx
 4b8:	f7 f3                	div    %ebx
 4ba:	89 d0                	mov    %edx,%eax
 4bc:	0f b6 80 94 0b 00 00 	movzbl 0xb94(%eax),%eax
 4c3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c7:	8b 75 10             	mov    0x10(%ebp),%esi
 4ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4cd:	ba 00 00 00 00       	mov    $0x0,%edx
 4d2:	f7 f6                	div    %esi
 4d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4db:	75 c7                	jne    4a4 <printint+0x39>
  if(neg)
 4dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e1:	74 10                	je     4f3 <printint+0x88>
    buf[i++] = '-';
 4e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e6:	8d 50 01             	lea    0x1(%eax),%edx
 4e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4f1:	eb 1f                	jmp    512 <printint+0xa7>
 4f3:	eb 1d                	jmp    512 <printint+0xa7>
    putc(fd, buf[i]);
 4f5:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fb:	01 d0                	add    %edx,%eax
 4fd:	0f b6 00             	movzbl (%eax),%eax
 500:	0f be c0             	movsbl %al,%eax
 503:	89 44 24 04          	mov    %eax,0x4(%esp)
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	89 04 24             	mov    %eax,(%esp)
 50d:	e8 31 ff ff ff       	call   443 <putc>
  while(--i >= 0)
 512:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 516:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 51a:	79 d9                	jns    4f5 <printint+0x8a>
}
 51c:	83 c4 30             	add    $0x30,%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 529:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 530:	8d 45 0c             	lea    0xc(%ebp),%eax
 533:	83 c0 04             	add    $0x4,%eax
 536:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 539:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 540:	e9 7c 01 00 00       	jmp    6c1 <printf+0x19e>
    c = fmt[i] & 0xff;
 545:	8b 55 0c             	mov    0xc(%ebp),%edx
 548:	8b 45 f0             	mov    -0x10(%ebp),%eax
 54b:	01 d0                	add    %edx,%eax
 54d:	0f b6 00             	movzbl (%eax),%eax
 550:	0f be c0             	movsbl %al,%eax
 553:	25 ff 00 00 00       	and    $0xff,%eax
 558:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 55b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55f:	75 2c                	jne    58d <printf+0x6a>
      if(c == '%'){
 561:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 565:	75 0c                	jne    573 <printf+0x50>
        state = '%';
 567:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 56e:	e9 4a 01 00 00       	jmp    6bd <printf+0x19a>
      } else {
        putc(fd, c);
 573:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 576:	0f be c0             	movsbl %al,%eax
 579:	89 44 24 04          	mov    %eax,0x4(%esp)
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	89 04 24             	mov    %eax,(%esp)
 583:	e8 bb fe ff ff       	call   443 <putc>
 588:	e9 30 01 00 00       	jmp    6bd <printf+0x19a>
      }
    } else if(state == '%'){
 58d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 591:	0f 85 26 01 00 00    	jne    6bd <printf+0x19a>
      if(c == 'd'){
 597:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 59b:	75 2d                	jne    5ca <printf+0xa7>
        printint(fd, *ap, 10, 1);
 59d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a0:	8b 00                	mov    (%eax),%eax
 5a2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a9:	00 
 5aa:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5b1:	00 
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	89 04 24             	mov    %eax,(%esp)
 5bc:	e8 aa fe ff ff       	call   46b <printint>
        ap++;
 5c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c5:	e9 ec 00 00 00       	jmp    6b6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5ca:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ce:	74 06                	je     5d6 <printf+0xb3>
 5d0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d4:	75 2d                	jne    603 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d9:	8b 00                	mov    (%eax),%eax
 5db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5e2:	00 
 5e3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5ea:	00 
 5eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	89 04 24             	mov    %eax,(%esp)
 5f5:	e8 71 fe ff ff       	call   46b <printint>
        ap++;
 5fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fe:	e9 b3 00 00 00       	jmp    6b6 <printf+0x193>
      } else if(c == 's'){
 603:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 607:	75 45                	jne    64e <printf+0x12b>
        s = (char*)*ap;
 609:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60c:	8b 00                	mov    (%eax),%eax
 60e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 611:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 615:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 619:	75 09                	jne    624 <printf+0x101>
          s = "(null)";
 61b:	c7 45 f4 27 09 00 00 	movl   $0x927,-0xc(%ebp)
        while(*s != 0){
 622:	eb 1e                	jmp    642 <printf+0x11f>
 624:	eb 1c                	jmp    642 <printf+0x11f>
          putc(fd, *s);
 626:	8b 45 f4             	mov    -0xc(%ebp),%eax
 629:	0f b6 00             	movzbl (%eax),%eax
 62c:	0f be c0             	movsbl %al,%eax
 62f:	89 44 24 04          	mov    %eax,0x4(%esp)
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	89 04 24             	mov    %eax,(%esp)
 639:	e8 05 fe ff ff       	call   443 <putc>
          s++;
 63e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 642:	8b 45 f4             	mov    -0xc(%ebp),%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	84 c0                	test   %al,%al
 64a:	75 da                	jne    626 <printf+0x103>
 64c:	eb 68                	jmp    6b6 <printf+0x193>
        }
      } else if(c == 'c'){
 64e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 652:	75 1d                	jne    671 <printf+0x14e>
        putc(fd, *ap);
 654:	8b 45 e8             	mov    -0x18(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	0f be c0             	movsbl %al,%eax
 65c:	89 44 24 04          	mov    %eax,0x4(%esp)
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	89 04 24             	mov    %eax,(%esp)
 666:	e8 d8 fd ff ff       	call   443 <putc>
        ap++;
 66b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66f:	eb 45                	jmp    6b6 <printf+0x193>
      } else if(c == '%'){
 671:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 675:	75 17                	jne    68e <printf+0x16b>
        putc(fd, c);
 677:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67a:	0f be c0             	movsbl %al,%eax
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 b7 fd ff ff       	call   443 <putc>
 68c:	eb 28                	jmp    6b6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 695:	00 
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 a2 fd ff ff       	call   443 <putc>
        putc(fd, c);
 6a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a4:	0f be c0             	movsbl %al,%eax
 6a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	89 04 24             	mov    %eax,(%esp)
 6b1:	e8 8d fd ff ff       	call   443 <putc>
      }
      state = 0;
 6b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c7:	01 d0                	add    %edx,%eax
 6c9:	0f b6 00             	movzbl (%eax),%eax
 6cc:	84 c0                	test   %al,%al
 6ce:	0f 85 71 fe ff ff    	jne    545 <printf+0x22>
    }
  }
}
 6d4:	c9                   	leave  
 6d5:	c3                   	ret    

000006d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d6:	55                   	push   %ebp
 6d7:	89 e5                	mov    %esp,%ebp
 6d9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	83 e8 08             	sub    $0x8,%eax
 6e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e5:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 6ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ed:	eb 24                	jmp    713 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	8b 00                	mov    (%eax),%eax
 6f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f7:	77 12                	ja     70b <free+0x35>
 6f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ff:	77 24                	ja     725 <free+0x4f>
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	8b 00                	mov    (%eax),%eax
 706:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 709:	77 1a                	ja     725 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70e:	8b 00                	mov    (%eax),%eax
 710:	89 45 fc             	mov    %eax,-0x4(%ebp)
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 719:	76 d4                	jbe    6ef <free+0x19>
 71b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71e:	8b 00                	mov    (%eax),%eax
 720:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 723:	76 ca                	jbe    6ef <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 725:	8b 45 f8             	mov    -0x8(%ebp),%eax
 728:	8b 40 04             	mov    0x4(%eax),%eax
 72b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 732:	8b 45 f8             	mov    -0x8(%ebp),%eax
 735:	01 c2                	add    %eax,%edx
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	39 c2                	cmp    %eax,%edx
 73e:	75 24                	jne    764 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 740:	8b 45 f8             	mov    -0x8(%ebp),%eax
 743:	8b 50 04             	mov    0x4(%eax),%edx
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	8b 00                	mov    (%eax),%eax
 74b:	8b 40 04             	mov    0x4(%eax),%eax
 74e:	01 c2                	add    %eax,%edx
 750:	8b 45 f8             	mov    -0x8(%ebp),%eax
 753:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	8b 00                	mov    (%eax),%eax
 75b:	8b 10                	mov    (%eax),%edx
 75d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 760:	89 10                	mov    %edx,(%eax)
 762:	eb 0a                	jmp    76e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 764:	8b 45 fc             	mov    -0x4(%ebp),%eax
 767:	8b 10                	mov    (%eax),%edx
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 40 04             	mov    0x4(%eax),%eax
 774:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	01 d0                	add    %edx,%eax
 780:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 783:	75 20                	jne    7a5 <free+0xcf>
    p->s.size += bp->s.size;
 785:	8b 45 fc             	mov    -0x4(%ebp),%eax
 788:	8b 50 04             	mov    0x4(%eax),%edx
 78b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78e:	8b 40 04             	mov    0x4(%eax),%eax
 791:	01 c2                	add    %eax,%edx
 793:	8b 45 fc             	mov    -0x4(%ebp),%eax
 796:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 799:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79c:	8b 10                	mov    (%eax),%edx
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	89 10                	mov    %edx,(%eax)
 7a3:	eb 08                	jmp    7ad <free+0xd7>
  } else
    p->s.ptr = bp;
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ab:	89 10                	mov    %edx,(%eax)
  freep = p;
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	a3 c8 0b 00 00       	mov    %eax,0xbc8
}
 7b5:	c9                   	leave  
 7b6:	c3                   	ret    

000007b7 <morecore>:

static Header*
morecore(uint nu)
{
 7b7:	55                   	push   %ebp
 7b8:	89 e5                	mov    %esp,%ebp
 7ba:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7bd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c4:	77 07                	ja     7cd <morecore+0x16>
    nu = 4096;
 7c6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	c1 e0 03             	shl    $0x3,%eax
 7d3:	89 04 24             	mov    %eax,(%esp)
 7d6:	e8 50 fc ff ff       	call   42b <sbrk>
 7db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7de:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7e2:	75 07                	jne    7eb <morecore+0x34>
    return 0;
 7e4:	b8 00 00 00 00       	mov    $0x0,%eax
 7e9:	eb 22                	jmp    80d <morecore+0x56>
  hp = (Header*)p;
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f4:	8b 55 08             	mov    0x8(%ebp),%edx
 7f7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	83 c0 08             	add    $0x8,%eax
 800:	89 04 24             	mov    %eax,(%esp)
 803:	e8 ce fe ff ff       	call   6d6 <free>
  return freep;
 808:	a1 c8 0b 00 00       	mov    0xbc8,%eax
}
 80d:	c9                   	leave  
 80e:	c3                   	ret    

0000080f <malloc>:

void*
malloc(uint nbytes)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	83 c0 07             	add    $0x7,%eax
 81b:	c1 e8 03             	shr    $0x3,%eax
 81e:	83 c0 01             	add    $0x1,%eax
 821:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 824:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 829:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 830:	75 23                	jne    855 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 832:	c7 45 f0 c0 0b 00 00 	movl   $0xbc0,-0x10(%ebp)
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	a3 c8 0b 00 00       	mov    %eax,0xbc8
 841:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 846:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    base.s.size = 0;
 84b:	c7 05 c4 0b 00 00 00 	movl   $0x0,0xbc4
 852:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 855:	8b 45 f0             	mov    -0x10(%ebp),%eax
 858:	8b 00                	mov    (%eax),%eax
 85a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 40 04             	mov    0x4(%eax),%eax
 863:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 866:	72 4d                	jb     8b5 <malloc+0xa6>
      if(p->s.size == nunits)
 868:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86b:	8b 40 04             	mov    0x4(%eax),%eax
 86e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 871:	75 0c                	jne    87f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 873:	8b 45 f4             	mov    -0xc(%ebp),%eax
 876:	8b 10                	mov    (%eax),%edx
 878:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87b:	89 10                	mov    %edx,(%eax)
 87d:	eb 26                	jmp    8a5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 87f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 882:	8b 40 04             	mov    0x4(%eax),%eax
 885:	2b 45 ec             	sub    -0x14(%ebp),%eax
 888:	89 c2                	mov    %eax,%edx
 88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 890:	8b 45 f4             	mov    -0xc(%ebp),%eax
 893:	8b 40 04             	mov    0x4(%eax),%eax
 896:	c1 e0 03             	shl    $0x3,%eax
 899:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8a2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a8:	a3 c8 0b 00 00       	mov    %eax,0xbc8
      return (void*)(p + 1);
 8ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b0:	83 c0 08             	add    $0x8,%eax
 8b3:	eb 38                	jmp    8ed <malloc+0xde>
    }
    if(p == freep)
 8b5:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 8ba:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8bd:	75 1b                	jne    8da <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c2:	89 04 24             	mov    %eax,(%esp)
 8c5:	e8 ed fe ff ff       	call   7b7 <morecore>
 8ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d1:	75 07                	jne    8da <malloc+0xcb>
        return 0;
 8d3:	b8 00 00 00 00       	mov    $0x0,%eax
 8d8:	eb 13                	jmp    8ed <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e8:	e9 70 ff ff ff       	jmp    85d <malloc+0x4e>
}
 8ed:	c9                   	leave  
 8ee:	c3                   	ret    
