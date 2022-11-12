docker run \
    --rm \
    --volume "$(pwd)/:/src" \
    --workdir "/src/" \
    swift:5.7.1-amazonlinux2 \
    swift build --product SquareNumber -c release -Xswiftc -static-stdlib

scripts/package.sh SquareNumber

aws lambda update-function-code --zip-file fileb://.build/lambda/SquareNumber/lambda.zip --function-name SquareNumber