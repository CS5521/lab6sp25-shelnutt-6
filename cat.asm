
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
  28:	c7 44 24 04 f7 08 00 	movl   $0x8f7,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 ef 04 00 00       	call   52b <printf>
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
  6b:	c7 44 24 04 09 09 00 	movl   $0x909,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 ac 04 00 00       	call   52b <printf>
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
  f3:	c7 44 24 04 1a 09 00 	movl   $0x91a,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 24 04 00 00       	call   52b <printf>
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

00000443 <hw>:
SYSCALL(hw)
 443:	b8 16 00 00 00       	mov    $0x16,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	83 ec 18             	sub    $0x18,%esp
 451:	8b 45 0c             	mov    0xc(%ebp),%eax
 454:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 457:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 45e:	00 
 45f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 462:	89 44 24 04          	mov    %eax,0x4(%esp)
 466:	8b 45 08             	mov    0x8(%ebp),%eax
 469:	89 04 24             	mov    %eax,(%esp)
 46c:	e8 52 ff ff ff       	call   3c3 <write>
}
 471:	c9                   	leave  
 472:	c3                   	ret    

00000473 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 473:	55                   	push   %ebp
 474:	89 e5                	mov    %esp,%ebp
 476:	56                   	push   %esi
 477:	53                   	push   %ebx
 478:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 47b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 482:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 486:	74 17                	je     49f <printint+0x2c>
 488:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 48c:	79 11                	jns    49f <printint+0x2c>
    neg = 1;
 48e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 495:	8b 45 0c             	mov    0xc(%ebp),%eax
 498:	f7 d8                	neg    %eax
 49a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49d:	eb 06                	jmp    4a5 <printint+0x32>
  } else {
    x = xx;
 49f:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4af:	8d 41 01             	lea    0x1(%ecx),%eax
 4b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4bb:	ba 00 00 00 00       	mov    $0x0,%edx
 4c0:	f7 f3                	div    %ebx
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	0f b6 80 9c 0b 00 00 	movzbl 0xb9c(%eax),%eax
 4cb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4cf:	8b 75 10             	mov    0x10(%ebp),%esi
 4d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d5:	ba 00 00 00 00       	mov    $0x0,%edx
 4da:	f7 f6                	div    %esi
 4dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e3:	75 c7                	jne    4ac <printint+0x39>
  if(neg)
 4e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e9:	74 10                	je     4fb <printint+0x88>
    buf[i++] = '-';
 4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ee:	8d 50 01             	lea    0x1(%eax),%edx
 4f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4f9:	eb 1f                	jmp    51a <printint+0xa7>
 4fb:	eb 1d                	jmp    51a <printint+0xa7>
    putc(fd, buf[i]);
 4fd:	8d 55 dc             	lea    -0x24(%ebp),%edx
 500:	8b 45 f4             	mov    -0xc(%ebp),%eax
 503:	01 d0                	add    %edx,%eax
 505:	0f b6 00             	movzbl (%eax),%eax
 508:	0f be c0             	movsbl %al,%eax
 50b:	89 44 24 04          	mov    %eax,0x4(%esp)
 50f:	8b 45 08             	mov    0x8(%ebp),%eax
 512:	89 04 24             	mov    %eax,(%esp)
 515:	e8 31 ff ff ff       	call   44b <putc>
  while(--i >= 0)
 51a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 51e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 522:	79 d9                	jns    4fd <printint+0x8a>
}
 524:	83 c4 30             	add    $0x30,%esp
 527:	5b                   	pop    %ebx
 528:	5e                   	pop    %esi
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    

0000052b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 52b:	55                   	push   %ebp
 52c:	89 e5                	mov    %esp,%ebp
 52e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 531:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 538:	8d 45 0c             	lea    0xc(%ebp),%eax
 53b:	83 c0 04             	add    $0x4,%eax
 53e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 541:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 548:	e9 7c 01 00 00       	jmp    6c9 <printf+0x19e>
    c = fmt[i] & 0xff;
 54d:	8b 55 0c             	mov    0xc(%ebp),%edx
 550:	8b 45 f0             	mov    -0x10(%ebp),%eax
 553:	01 d0                	add    %edx,%eax
 555:	0f b6 00             	movzbl (%eax),%eax
 558:	0f be c0             	movsbl %al,%eax
 55b:	25 ff 00 00 00       	and    $0xff,%eax
 560:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 563:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 567:	75 2c                	jne    595 <printf+0x6a>
      if(c == '%'){
 569:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56d:	75 0c                	jne    57b <printf+0x50>
        state = '%';
 56f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 576:	e9 4a 01 00 00       	jmp    6c5 <printf+0x19a>
      } else {
        putc(fd, c);
 57b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57e:	0f be c0             	movsbl %al,%eax
 581:	89 44 24 04          	mov    %eax,0x4(%esp)
 585:	8b 45 08             	mov    0x8(%ebp),%eax
 588:	89 04 24             	mov    %eax,(%esp)
 58b:	e8 bb fe ff ff       	call   44b <putc>
 590:	e9 30 01 00 00       	jmp    6c5 <printf+0x19a>
      }
    } else if(state == '%'){
 595:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 599:	0f 85 26 01 00 00    	jne    6c5 <printf+0x19a>
      if(c == 'd'){
 59f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a3:	75 2d                	jne    5d2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a8:	8b 00                	mov    (%eax),%eax
 5aa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b1:	00 
 5b2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5b9:	00 
 5ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
 5c1:	89 04 24             	mov    %eax,(%esp)
 5c4:	e8 aa fe ff ff       	call   473 <printint>
        ap++;
 5c9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5cd:	e9 ec 00 00 00       	jmp    6be <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5d2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5d6:	74 06                	je     5de <printf+0xb3>
 5d8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5dc:	75 2d                	jne    60b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5de:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ea:	00 
 5eb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f2:	00 
 5f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	89 04 24             	mov    %eax,(%esp)
 5fd:	e8 71 fe ff ff       	call   473 <printint>
        ap++;
 602:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 606:	e9 b3 00 00 00       	jmp    6be <printf+0x193>
      } else if(c == 's'){
 60b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 60f:	75 45                	jne    656 <printf+0x12b>
        s = (char*)*ap;
 611:	8b 45 e8             	mov    -0x18(%ebp),%eax
 614:	8b 00                	mov    (%eax),%eax
 616:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 619:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 61d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 621:	75 09                	jne    62c <printf+0x101>
          s = "(null)";
 623:	c7 45 f4 2f 09 00 00 	movl   $0x92f,-0xc(%ebp)
        while(*s != 0){
 62a:	eb 1e                	jmp    64a <printf+0x11f>
 62c:	eb 1c                	jmp    64a <printf+0x11f>
          putc(fd, *s);
 62e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 631:	0f b6 00             	movzbl (%eax),%eax
 634:	0f be c0             	movsbl %al,%eax
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 05 fe ff ff       	call   44b <putc>
          s++;
 646:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 64a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64d:	0f b6 00             	movzbl (%eax),%eax
 650:	84 c0                	test   %al,%al
 652:	75 da                	jne    62e <printf+0x103>
 654:	eb 68                	jmp    6be <printf+0x193>
        }
      } else if(c == 'c'){
 656:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 65a:	75 1d                	jne    679 <printf+0x14e>
        putc(fd, *ap);
 65c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	0f be c0             	movsbl %al,%eax
 664:	89 44 24 04          	mov    %eax,0x4(%esp)
 668:	8b 45 08             	mov    0x8(%ebp),%eax
 66b:	89 04 24             	mov    %eax,(%esp)
 66e:	e8 d8 fd ff ff       	call   44b <putc>
        ap++;
 673:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 677:	eb 45                	jmp    6be <printf+0x193>
      } else if(c == '%'){
 679:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 67d:	75 17                	jne    696 <printf+0x16b>
        putc(fd, c);
 67f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 682:	0f be c0             	movsbl %al,%eax
 685:	89 44 24 04          	mov    %eax,0x4(%esp)
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	89 04 24             	mov    %eax,(%esp)
 68f:	e8 b7 fd ff ff       	call   44b <putc>
 694:	eb 28                	jmp    6be <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 696:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 69d:	00 
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	89 04 24             	mov    %eax,(%esp)
 6a4:	e8 a2 fd ff ff       	call   44b <putc>
        putc(fd, c);
 6a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ac:	0f be c0             	movsbl %al,%eax
 6af:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	89 04 24             	mov    %eax,(%esp)
 6b9:	e8 8d fd ff ff       	call   44b <putc>
      }
      state = 0;
 6be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 6cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6cf:	01 d0                	add    %edx,%eax
 6d1:	0f b6 00             	movzbl (%eax),%eax
 6d4:	84 c0                	test   %al,%al
 6d6:	0f 85 71 fe ff ff    	jne    54d <printf+0x22>
    }
  }
}
 6dc:	c9                   	leave  
 6dd:	c3                   	ret    

000006de <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6de:	55                   	push   %ebp
 6df:	89 e5                	mov    %esp,%ebp
 6e1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	83 e8 08             	sub    $0x8,%eax
 6ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ed:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 6f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f5:	eb 24                	jmp    71b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ff:	77 12                	ja     713 <free+0x35>
 701:	8b 45 f8             	mov    -0x8(%ebp),%eax
 704:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 707:	77 24                	ja     72d <free+0x4f>
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 711:	77 1a                	ja     72d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 713:	8b 45 fc             	mov    -0x4(%ebp),%eax
 716:	8b 00                	mov    (%eax),%eax
 718:	89 45 fc             	mov    %eax,-0x4(%ebp)
 71b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 721:	76 d4                	jbe    6f7 <free+0x19>
 723:	8b 45 fc             	mov    -0x4(%ebp),%eax
 726:	8b 00                	mov    (%eax),%eax
 728:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72b:	76 ca                	jbe    6f7 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 72d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 730:	8b 40 04             	mov    0x4(%eax),%eax
 733:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73d:	01 c2                	add    %eax,%edx
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	8b 00                	mov    (%eax),%eax
 744:	39 c2                	cmp    %eax,%edx
 746:	75 24                	jne    76c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 748:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74b:	8b 50 04             	mov    0x4(%eax),%edx
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 00                	mov    (%eax),%eax
 753:	8b 40 04             	mov    0x4(%eax),%eax
 756:	01 c2                	add    %eax,%edx
 758:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	8b 10                	mov    (%eax),%edx
 765:	8b 45 f8             	mov    -0x8(%ebp),%eax
 768:	89 10                	mov    %edx,(%eax)
 76a:	eb 0a                	jmp    776 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 10                	mov    (%eax),%edx
 771:	8b 45 f8             	mov    -0x8(%ebp),%eax
 774:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 776:	8b 45 fc             	mov    -0x4(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 783:	8b 45 fc             	mov    -0x4(%ebp),%eax
 786:	01 d0                	add    %edx,%eax
 788:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78b:	75 20                	jne    7ad <free+0xcf>
    p->s.size += bp->s.size;
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 50 04             	mov    0x4(%eax),%edx
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	8b 40 04             	mov    0x4(%eax),%eax
 799:	01 c2                	add    %eax,%edx
 79b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	8b 10                	mov    (%eax),%edx
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	89 10                	mov    %edx,(%eax)
 7ab:	eb 08                	jmp    7b5 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7b3:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	a3 c8 0b 00 00       	mov    %eax,0xbc8
}
 7bd:	c9                   	leave  
 7be:	c3                   	ret    

000007bf <morecore>:

static Header*
morecore(uint nu)
{
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7c5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7cc:	77 07                	ja     7d5 <morecore+0x16>
    nu = 4096;
 7ce:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	c1 e0 03             	shl    $0x3,%eax
 7db:	89 04 24             	mov    %eax,(%esp)
 7de:	e8 48 fc ff ff       	call   42b <sbrk>
 7e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7e6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ea:	75 07                	jne    7f3 <morecore+0x34>
    return 0;
 7ec:	b8 00 00 00 00       	mov    $0x0,%eax
 7f1:	eb 22                	jmp    815 <morecore+0x56>
  hp = (Header*)p;
 7f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fc:	8b 55 08             	mov    0x8(%ebp),%edx
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 802:	8b 45 f0             	mov    -0x10(%ebp),%eax
 805:	83 c0 08             	add    $0x8,%eax
 808:	89 04 24             	mov    %eax,(%esp)
 80b:	e8 ce fe ff ff       	call   6de <free>
  return freep;
 810:	a1 c8 0b 00 00       	mov    0xbc8,%eax
}
 815:	c9                   	leave  
 816:	c3                   	ret    

00000817 <malloc>:

void*
malloc(uint nbytes)
{
 817:	55                   	push   %ebp
 818:	89 e5                	mov    %esp,%ebp
 81a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
 820:	83 c0 07             	add    $0x7,%eax
 823:	c1 e8 03             	shr    $0x3,%eax
 826:	83 c0 01             	add    $0x1,%eax
 829:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 82c:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 831:	89 45 f0             	mov    %eax,-0x10(%ebp)
 834:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 838:	75 23                	jne    85d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 83a:	c7 45 f0 c0 0b 00 00 	movl   $0xbc0,-0x10(%ebp)
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	a3 c8 0b 00 00       	mov    %eax,0xbc8
 849:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 84e:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    base.s.size = 0;
 853:	c7 05 c4 0b 00 00 00 	movl   $0x0,0xbc4
 85a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 860:	8b 00                	mov    (%eax),%eax
 862:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	8b 40 04             	mov    0x4(%eax),%eax
 86b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86e:	72 4d                	jb     8bd <malloc+0xa6>
      if(p->s.size == nunits)
 870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 873:	8b 40 04             	mov    0x4(%eax),%eax
 876:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 879:	75 0c                	jne    887 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	8b 10                	mov    (%eax),%edx
 880:	8b 45 f0             	mov    -0x10(%ebp),%eax
 883:	89 10                	mov    %edx,(%eax)
 885:	eb 26                	jmp    8ad <malloc+0x96>
      else {
        p->s.size -= nunits;
 887:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88a:	8b 40 04             	mov    0x4(%eax),%eax
 88d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 890:	89 c2                	mov    %eax,%edx
 892:	8b 45 f4             	mov    -0xc(%ebp),%eax
 895:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 898:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89b:	8b 40 04             	mov    0x4(%eax),%eax
 89e:	c1 e0 03             	shl    $0x3,%eax
 8a1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8aa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b0:	a3 c8 0b 00 00       	mov    %eax,0xbc8
      return (void*)(p + 1);
 8b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b8:	83 c0 08             	add    $0x8,%eax
 8bb:	eb 38                	jmp    8f5 <malloc+0xde>
    }
    if(p == freep)
 8bd:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 8c2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8c5:	75 1b                	jne    8e2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ca:	89 04 24             	mov    %eax,(%esp)
 8cd:	e8 ed fe ff ff       	call   7bf <morecore>
 8d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d9:	75 07                	jne    8e2 <malloc+0xcb>
        return 0;
 8db:	b8 00 00 00 00       	mov    $0x0,%eax
 8e0:	eb 13                	jmp    8f5 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 00                	mov    (%eax),%eax
 8ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8f0:	e9 70 ff ff ff       	jmp    865 <malloc+0x4e>
}
 8f5:	c9                   	leave  
 8f6:	c3                   	ret    
