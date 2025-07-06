
# this is
push:
	git add .
	git commit -m "💾"
	git push gitlab
	git push github

rule1:
	echo "bye"
rule2: rule1
#rule3:
	@#echo "hello"
	#$(MAKE) rule1
