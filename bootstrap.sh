nodes=(shibuya ebisu meguro gotanda)

for node in ${nodes[@]}; do
    vagrant up ${node}
    sleep 5
    bundle exec itamae ssh --vagrant --host ${node} ./roles/search.rb
done
