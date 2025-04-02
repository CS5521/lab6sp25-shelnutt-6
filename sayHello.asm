
_sayHello:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
	hw();
   6:	e8 0d 03 00 00       	call   318 <hw>
	exit();
   b:	e8 68 02 00 00       	call   278 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 44 01 00 00       	call   290 <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 07 01 00 00       	call   2b8 <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 fd 00 00 00       	call   2d0 <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 bf 00 00 00       	call   2a0 <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 270:	b8 01 00 00 00       	mov    $0x1,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <exit>:
SYSCALL(exit)
 278:	b8 02 00 00 00       	mov    $0x2,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <wait>:
SYSCALL(wait)
 280:	b8 03 00 00 00       	mov    $0x3,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <pipe>:
SYSCALL(pipe)
 288:	b8 04 00 00 00       	mov    $0x4,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <read>:
SYSCALL(read)
 290:	b8 05 00 00 00       	mov    $0x5,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <write>:
SYSCALL(write)
 298:	b8 10 00 00 00       	mov    $0x10,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <close>:
SYSCALL(close)
 2a0:	b8 15 00 00 00       	mov    $0x15,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <kill>:
SYSCALL(kill)
 2a8:	b8 06 00 00 00       	mov    $0x6,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <exec>:
SYSCALL(exec)
 2b0:	b8 07 00 00 00       	mov    $0x7,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <open>:
SYSCALL(open)
 2b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mknod>:
SYSCALL(mknod)
 2c0:	b8 11 00 00 00       	mov    $0x11,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <unlink>:
SYSCALL(unlink)
 2c8:	b8 12 00 00 00       	mov    $0x12,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <fstat>:
SYSCALL(fstat)
 2d0:	b8 08 00 00 00       	mov    $0x8,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <link>:
SYSCALL(link)
 2d8:	b8 13 00 00 00       	mov    $0x13,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mkdir>:
SYSCALL(mkdir)
 2e0:	b8 14 00 00 00       	mov    $0x14,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <chdir>:
SYSCALL(chdir)
 2e8:	b8 09 00 00 00       	mov    $0x9,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <dup>:
SYSCALL(dup)
 2f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <getpid>:
SYSCALL(getpid)
 2f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <sbrk>:
SYSCALL(sbrk)
 300:	b8 0c 00 00 00       	mov    $0xc,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <sleep>:
SYSCALL(sleep)
 308:	b8 0d 00 00 00       	mov    $0xd,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <uptime>:
SYSCALL(uptime)
 310:	b8 0e 00 00 00       	mov    $0xe,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <hw>:
SYSCALL(hw)
 318:	b8 16 00 00 00       	mov    $0x16,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	83 ec 18             	sub    $0x18,%esp
 326:	8b 45 0c             	mov    0xc(%ebp),%eax
 329:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 32c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 333:	00 
 334:	8d 45 f4             	lea    -0xc(%ebp),%eax
 337:	89 44 24 04          	mov    %eax,0x4(%esp)
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	89 04 24             	mov    %eax,(%esp)
 341:	e8 52 ff ff ff       	call   298 <write>
}
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	56                   	push   %esi
 34c:	53                   	push   %ebx
 34d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 350:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 357:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 35b:	74 17                	je     374 <printint+0x2c>
 35d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 361:	79 11                	jns    374 <printint+0x2c>
    neg = 1;
 363:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	f7 d8                	neg    %eax
 36f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 372:	eb 06                	jmp    37a <printint+0x32>
  } else {
    x = xx;
 374:	8b 45 0c             	mov    0xc(%ebp),%eax
 377:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 37a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 381:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 384:	8d 41 01             	lea    0x1(%ecx),%eax
 387:	89 45 f4             	mov    %eax,-0xc(%ebp)
 38a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 38d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 390:	ba 00 00 00 00       	mov    $0x0,%edx
 395:	f7 f3                	div    %ebx
 397:	89 d0                	mov    %edx,%eax
 399:	0f b6 80 18 0a 00 00 	movzbl 0xa18(%eax),%eax
 3a0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3a4:	8b 75 10             	mov    0x10(%ebp),%esi
 3a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3aa:	ba 00 00 00 00       	mov    $0x0,%edx
 3af:	f7 f6                	div    %esi
 3b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3b8:	75 c7                	jne    381 <printint+0x39>
  if(neg)
 3ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3be:	74 10                	je     3d0 <printint+0x88>
    buf[i++] = '-';
 3c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c3:	8d 50 01             	lea    0x1(%eax),%edx
 3c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3ce:	eb 1f                	jmp    3ef <printint+0xa7>
 3d0:	eb 1d                	jmp    3ef <printint+0xa7>
    putc(fd, buf[i]);
 3d2:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d8:	01 d0                	add    %edx,%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f be c0             	movsbl %al,%eax
 3e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3e4:	8b 45 08             	mov    0x8(%ebp),%eax
 3e7:	89 04 24             	mov    %eax,(%esp)
 3ea:	e8 31 ff ff ff       	call   320 <putc>
  while(--i >= 0)
 3ef:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3f7:	79 d9                	jns    3d2 <printint+0x8a>
}
 3f9:	83 c4 30             	add    $0x30,%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 406:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 40d:	8d 45 0c             	lea    0xc(%ebp),%eax
 410:	83 c0 04             	add    $0x4,%eax
 413:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 416:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 41d:	e9 7c 01 00 00       	jmp    59e <printf+0x19e>
    c = fmt[i] & 0xff;
 422:	8b 55 0c             	mov    0xc(%ebp),%edx
 425:	8b 45 f0             	mov    -0x10(%ebp),%eax
 428:	01 d0                	add    %edx,%eax
 42a:	0f b6 00             	movzbl (%eax),%eax
 42d:	0f be c0             	movsbl %al,%eax
 430:	25 ff 00 00 00       	and    $0xff,%eax
 435:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 438:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 43c:	75 2c                	jne    46a <printf+0x6a>
      if(c == '%'){
 43e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 442:	75 0c                	jne    450 <printf+0x50>
        state = '%';
 444:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 44b:	e9 4a 01 00 00       	jmp    59a <printf+0x19a>
      } else {
        putc(fd, c);
 450:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 453:	0f be c0             	movsbl %al,%eax
 456:	89 44 24 04          	mov    %eax,0x4(%esp)
 45a:	8b 45 08             	mov    0x8(%ebp),%eax
 45d:	89 04 24             	mov    %eax,(%esp)
 460:	e8 bb fe ff ff       	call   320 <putc>
 465:	e9 30 01 00 00       	jmp    59a <printf+0x19a>
      }
    } else if(state == '%'){
 46a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 46e:	0f 85 26 01 00 00    	jne    59a <printf+0x19a>
      if(c == 'd'){
 474:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 478:	75 2d                	jne    4a7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 47a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 47d:	8b 00                	mov    (%eax),%eax
 47f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 486:	00 
 487:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 48e:	00 
 48f:	89 44 24 04          	mov    %eax,0x4(%esp)
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	89 04 24             	mov    %eax,(%esp)
 499:	e8 aa fe ff ff       	call   348 <printint>
        ap++;
 49e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4a2:	e9 ec 00 00 00       	jmp    593 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4a7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ab:	74 06                	je     4b3 <printf+0xb3>
 4ad:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4b1:	75 2d                	jne    4e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b6:	8b 00                	mov    (%eax),%eax
 4b8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4bf:	00 
 4c0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4c7:	00 
 4c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cc:	8b 45 08             	mov    0x8(%ebp),%eax
 4cf:	89 04 24             	mov    %eax,(%esp)
 4d2:	e8 71 fe ff ff       	call   348 <printint>
        ap++;
 4d7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4db:	e9 b3 00 00 00       	jmp    593 <printf+0x193>
      } else if(c == 's'){
 4e0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4e4:	75 45                	jne    52b <printf+0x12b>
        s = (char*)*ap;
 4e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e9:	8b 00                	mov    (%eax),%eax
 4eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4ee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f6:	75 09                	jne    501 <printf+0x101>
          s = "(null)";
 4f8:	c7 45 f4 cc 07 00 00 	movl   $0x7cc,-0xc(%ebp)
        while(*s != 0){
 4ff:	eb 1e                	jmp    51f <printf+0x11f>
 501:	eb 1c                	jmp    51f <printf+0x11f>
          putc(fd, *s);
 503:	8b 45 f4             	mov    -0xc(%ebp),%eax
 506:	0f b6 00             	movzbl (%eax),%eax
 509:	0f be c0             	movsbl %al,%eax
 50c:	89 44 24 04          	mov    %eax,0x4(%esp)
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	89 04 24             	mov    %eax,(%esp)
 516:	e8 05 fe ff ff       	call   320 <putc>
          s++;
 51b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 51f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 522:	0f b6 00             	movzbl (%eax),%eax
 525:	84 c0                	test   %al,%al
 527:	75 da                	jne    503 <printf+0x103>
 529:	eb 68                	jmp    593 <printf+0x193>
        }
      } else if(c == 'c'){
 52b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 52f:	75 1d                	jne    54e <printf+0x14e>
        putc(fd, *ap);
 531:	8b 45 e8             	mov    -0x18(%ebp),%eax
 534:	8b 00                	mov    (%eax),%eax
 536:	0f be c0             	movsbl %al,%eax
 539:	89 44 24 04          	mov    %eax,0x4(%esp)
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
 540:	89 04 24             	mov    %eax,(%esp)
 543:	e8 d8 fd ff ff       	call   320 <putc>
        ap++;
 548:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 54c:	eb 45                	jmp    593 <printf+0x193>
      } else if(c == '%'){
 54e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 552:	75 17                	jne    56b <printf+0x16b>
        putc(fd, c);
 554:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 557:	0f be c0             	movsbl %al,%eax
 55a:	89 44 24 04          	mov    %eax,0x4(%esp)
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 04 24             	mov    %eax,(%esp)
 564:	e8 b7 fd ff ff       	call   320 <putc>
 569:	eb 28                	jmp    593 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 56b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 572:	00 
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	89 04 24             	mov    %eax,(%esp)
 579:	e8 a2 fd ff ff       	call   320 <putc>
        putc(fd, c);
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 8d fd ff ff       	call   320 <putc>
      }
      state = 0;
 593:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 59a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 59e:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a4:	01 d0                	add    %edx,%eax
 5a6:	0f b6 00             	movzbl (%eax),%eax
 5a9:	84 c0                	test   %al,%al
 5ab:	0f 85 71 fe ff ff    	jne    422 <printf+0x22>
    }
  }
}
 5b1:	c9                   	leave  
 5b2:	c3                   	ret    

000005b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b3:	55                   	push   %ebp
 5b4:	89 e5                	mov    %esp,%ebp
 5b6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	83 e8 08             	sub    $0x8,%eax
 5bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c2:	a1 34 0a 00 00       	mov    0xa34,%eax
 5c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ca:	eb 24                	jmp    5f0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5cf:	8b 00                	mov    (%eax),%eax
 5d1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5d4:	77 12                	ja     5e8 <free+0x35>
 5d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5dc:	77 24                	ja     602 <free+0x4f>
 5de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5e6:	77 1a                	ja     602 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5eb:	8b 00                	mov    (%eax),%eax
 5ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f6:	76 d4                	jbe    5cc <free+0x19>
 5f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fb:	8b 00                	mov    (%eax),%eax
 5fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 600:	76 ca                	jbe    5cc <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 602:	8b 45 f8             	mov    -0x8(%ebp),%eax
 605:	8b 40 04             	mov    0x4(%eax),%eax
 608:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 60f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 612:	01 c2                	add    %eax,%edx
 614:	8b 45 fc             	mov    -0x4(%ebp),%eax
 617:	8b 00                	mov    (%eax),%eax
 619:	39 c2                	cmp    %eax,%edx
 61b:	75 24                	jne    641 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 61d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 620:	8b 50 04             	mov    0x4(%eax),%edx
 623:	8b 45 fc             	mov    -0x4(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
 628:	8b 40 04             	mov    0x4(%eax),%eax
 62b:	01 c2                	add    %eax,%edx
 62d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 630:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 633:	8b 45 fc             	mov    -0x4(%ebp),%eax
 636:	8b 00                	mov    (%eax),%eax
 638:	8b 10                	mov    (%eax),%edx
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	89 10                	mov    %edx,(%eax)
 63f:	eb 0a                	jmp    64b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 10                	mov    (%eax),%edx
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 40 04             	mov    0x4(%eax),%eax
 651:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 658:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65b:	01 d0                	add    %edx,%eax
 65d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 660:	75 20                	jne    682 <free+0xcf>
    p->s.size += bp->s.size;
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	8b 40 04             	mov    0x4(%eax),%eax
 66e:	01 c2                	add    %eax,%edx
 670:	8b 45 fc             	mov    -0x4(%ebp),%eax
 673:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	8b 10                	mov    (%eax),%edx
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	89 10                	mov    %edx,(%eax)
 680:	eb 08                	jmp    68a <free+0xd7>
  } else
    p->s.ptr = bp;
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	8b 55 f8             	mov    -0x8(%ebp),%edx
 688:	89 10                	mov    %edx,(%eax)
  freep = p;
 68a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68d:	a3 34 0a 00 00       	mov    %eax,0xa34
}
 692:	c9                   	leave  
 693:	c3                   	ret    

00000694 <morecore>:

static Header*
morecore(uint nu)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 69a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6a1:	77 07                	ja     6aa <morecore+0x16>
    nu = 4096;
 6a3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	c1 e0 03             	shl    $0x3,%eax
 6b0:	89 04 24             	mov    %eax,(%esp)
 6b3:	e8 48 fc ff ff       	call   300 <sbrk>
 6b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6bb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6bf:	75 07                	jne    6c8 <morecore+0x34>
    return 0;
 6c1:	b8 00 00 00 00       	mov    $0x0,%eax
 6c6:	eb 22                	jmp    6ea <morecore+0x56>
  hp = (Header*)p;
 6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d1:	8b 55 08             	mov    0x8(%ebp),%edx
 6d4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6da:	83 c0 08             	add    $0x8,%eax
 6dd:	89 04 24             	mov    %eax,(%esp)
 6e0:	e8 ce fe ff ff       	call   5b3 <free>
  return freep;
 6e5:	a1 34 0a 00 00       	mov    0xa34,%eax
}
 6ea:	c9                   	leave  
 6eb:	c3                   	ret    

000006ec <malloc>:

void*
malloc(uint nbytes)
{
 6ec:	55                   	push   %ebp
 6ed:	89 e5                	mov    %esp,%ebp
 6ef:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	83 c0 07             	add    $0x7,%eax
 6f8:	c1 e8 03             	shr    $0x3,%eax
 6fb:	83 c0 01             	add    $0x1,%eax
 6fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 701:	a1 34 0a 00 00       	mov    0xa34,%eax
 706:	89 45 f0             	mov    %eax,-0x10(%ebp)
 709:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70d:	75 23                	jne    732 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 70f:	c7 45 f0 2c 0a 00 00 	movl   $0xa2c,-0x10(%ebp)
 716:	8b 45 f0             	mov    -0x10(%ebp),%eax
 719:	a3 34 0a 00 00       	mov    %eax,0xa34
 71e:	a1 34 0a 00 00       	mov    0xa34,%eax
 723:	a3 2c 0a 00 00       	mov    %eax,0xa2c
    base.s.size = 0;
 728:	c7 05 30 0a 00 00 00 	movl   $0x0,0xa30
 72f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 732:	8b 45 f0             	mov    -0x10(%ebp),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 73a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73d:	8b 40 04             	mov    0x4(%eax),%eax
 740:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 743:	72 4d                	jb     792 <malloc+0xa6>
      if(p->s.size == nunits)
 745:	8b 45 f4             	mov    -0xc(%ebp),%eax
 748:	8b 40 04             	mov    0x4(%eax),%eax
 74b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 74e:	75 0c                	jne    75c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 750:	8b 45 f4             	mov    -0xc(%ebp),%eax
 753:	8b 10                	mov    (%eax),%edx
 755:	8b 45 f0             	mov    -0x10(%ebp),%eax
 758:	89 10                	mov    %edx,(%eax)
 75a:	eb 26                	jmp    782 <malloc+0x96>
      else {
        p->s.size -= nunits;
 75c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75f:	8b 40 04             	mov    0x4(%eax),%eax
 762:	2b 45 ec             	sub    -0x14(%ebp),%eax
 765:	89 c2                	mov    %eax,%edx
 767:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 76d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 770:	8b 40 04             	mov    0x4(%eax),%eax
 773:	c1 e0 03             	shl    $0x3,%eax
 776:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 779:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 77f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 782:	8b 45 f0             	mov    -0x10(%ebp),%eax
 785:	a3 34 0a 00 00       	mov    %eax,0xa34
      return (void*)(p + 1);
 78a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78d:	83 c0 08             	add    $0x8,%eax
 790:	eb 38                	jmp    7ca <malloc+0xde>
    }
    if(p == freep)
 792:	a1 34 0a 00 00       	mov    0xa34,%eax
 797:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 79a:	75 1b                	jne    7b7 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 79c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79f:	89 04 24             	mov    %eax,(%esp)
 7a2:	e8 ed fe ff ff       	call   694 <morecore>
 7a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ae:	75 07                	jne    7b7 <malloc+0xcb>
        return 0;
 7b0:	b8 00 00 00 00       	mov    $0x0,%eax
 7b5:	eb 13                	jmp    7ca <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	8b 00                	mov    (%eax),%eax
 7c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7c5:	e9 70 ff ff ff       	jmp    73a <malloc+0x4e>
}
 7ca:	c9                   	leave  
 7cb:	c3                   	ret    
