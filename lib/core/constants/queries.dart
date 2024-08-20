String getPokesQuery = r'''query Pokemon_v2_pokemonspecies ($limit :Int) {
    pokemon_v2_pokemonspecies(limit: $limit) {
        base_happiness
        capture_rate
        evolution_chain_id
        evolves_from_species_id
        forms_switchable
        gender_rate
        generation_id
        growth_rate_id
        has_gender_differences
        hatch_counter
        id
        is_baby
        is_legendary
        is_mythical
        name
        order
        pokemon_color_id
        pokemon_habitat_id
        pokemon_shape_id
    }
}
''';
