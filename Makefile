all: prep package_model synth deploy

prep:
	bash -e scripts/setup.sh

update_notice:
	bash -e scripts/update_notice.sh

cdk_bootstrap:
	. ./.venv/bin/activate && cdk bootstrap

synth:
	. .venv/bin/activate && cdk synth

deploy:
	. .venv/bin/activate && cdk deploy

destroy:
	. .venv/bin/activate && cdk destroy

clean: 
	rm -r .venv/ cdk.out/
