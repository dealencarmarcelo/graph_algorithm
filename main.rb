class Graph
    hash = { vertex: [0, 1, 2, 3, 4, 5, 6, 7], 
             edge: [[0, 3], [3, 5], [5, 6], [5, 7], 
                    [1, 2], [2, 6], [4, 6], [6, 7]] }

    loaded = []

    hash[:vertex].each do |value|
        loaded << value if hash[:edge].all? { |v| value != v[1] }
    end
    hash[:vertex].each do |value|
        if !hash[:edge].all? { |v| value != v[1] }
            aux = []
            hash[:edge].each do |n|
                next if n[1] != value
                aux << n[0]                
            end
            loaded << value if aux.all? { |v| loaded.include?(v) }
        else
            next
        end
    end
    p "Ordened load sequence: #{loaded.join(', ')}"
end