#!/bin/bash  
  
# 获取当前tag，默认为空  
CURTAG=$(git describe --abbrev=0 --tags 2>/dev/null || echo "")  
CURTAG="${CURTAG#v}"  # 去除前缀'v'  
  
# 如果当前tag为空，则默认版本为0.0.0  
if [[ -z "$CURTAG" ]]; then  
    MAJ=0  
    MIN=0  
    BUG=0  
else  
    IFS='.' read -ra vers <<< "$CURTAG"  
    MAJ=${vers[0]}  
    MIN=${vers[1]:-0}  # 如果MIN不存在，则默认为0  
    BUG=${vers[2]:-0}  # 如果BUG不存在，则默认为0  
fi  
  
echo "Current Tag: v$MAJ.$MIN.$BUG"  
  
for cmd in "$@"; do  
    case $cmd in  
        "--major")  
            ((MAJ++))  
            MIN=0  
            BUG=0  
            echo "Incrementing Major Version#"  
            ;;  
        "--minor")  
            ((MIN++))  
            BUG=0  
            echo "Incrementing Minor Version#"  
            ;;  
        "--bug")  
            ((BUG++))  
            echo "Incrementing Bug Version#"  
            ;;  
        *)  
            echo "Unknown option: $cmd"  
            exit 1  
            ;;  
    esac  
done  
  
NEWTAG="v$MAJ.$MIN.$BUG"  
echo "Adding Tag: $NEWTAG"  
git tag -a "$NEWTAG" -m "Release $NEWTAG"  # 添加有意义的提交消息