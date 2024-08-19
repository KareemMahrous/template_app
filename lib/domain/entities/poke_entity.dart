import 'package:equatable/equatable.dart';

class PokeEntity with EquatableMixin {
  final int? baseHappiness;
  final int? captureRate;
  final int? evolutionChainId;
  final String? evolvesFromSpeciesId;
  final bool? formsSwitchable;
  final int? genderRate;
  final int? generationId;
  final int? growthRateId;
  final bool? hasGenderDifferences;
  final int? hatchCounter;
  final int id;
  final bool? isBaby;
  final bool? isLegendary;
  final bool? isMythical;
  final String name;
  final int? order;
  final int? pokemonColorId;
  final int? pokemonHabitatId;
  final int? pokemonShapeId;

  const PokeEntity({
    this.baseHappiness,
    this.captureRate,
    this.evolutionChainId,
    this.evolvesFromSpeciesId,
    this.formsSwitchable,
    this.genderRate,
    this.generationId,
    this.growthRateId,
    this.hasGenderDifferences,
    this.hatchCounter,
    required this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    required this.name,
    this.order,
    this.pokemonColorId,
    this.pokemonHabitatId,
    this.pokemonShapeId,
  });

  @override
  List<Object?> get props => [
        baseHappiness,
        captureRate,
        evolutionChainId,
        evolvesFromSpeciesId,
        formsSwitchable,
        genderRate,
        generationId,
        growthRateId,
        hasGenderDifferences,
        hatchCounter,
        id,
        isBaby,
        isLegendary,
        isMythical,
        name,
        order,
        pokemonColorId,
        pokemonHabitatId,
        pokemonShapeId
      ];

  PokeEntity copyWith({
    int? baseHappiness,
    int? captureRate,
    int? evolutionChainId,
    Null evolvesFromSpeciesId,
    bool? formsSwitchable,
    int? genderRate,
    int? generationId,
    int? growthRateId,
    bool? hasGenderDifferences,
    int? hatchCounter,
    int? id,
    bool? isBaby,
    bool? isLegendary,
    bool? isMythical,
    String? name,
    int? order,
    int? pokemonColorId,
    int? pokemonHabitatId,
    int? pokemonShapeId,
  }) {
    return PokeEntity(
      baseHappiness: baseHappiness ?? this.baseHappiness,
      captureRate: captureRate ?? this.captureRate,
      evolutionChainId: evolutionChainId ?? this.evolutionChainId,
      evolvesFromSpeciesId: evolvesFromSpeciesId ?? this.evolvesFromSpeciesId,
      formsSwitchable: formsSwitchable ?? this.formsSwitchable,
      genderRate: genderRate ?? this.genderRate,
      generationId: generationId ?? this.generationId,
      growthRateId: growthRateId ?? this.growthRateId,
      hasGenderDifferences: hasGenderDifferences ?? this.hasGenderDifferences,
      hatchCounter: hatchCounter ?? this.hatchCounter,
      id: id ?? this.id,
      isBaby: isBaby ?? this.isBaby,
      isLegendary: isLegendary ?? this.isLegendary,
      isMythical: isMythical ?? this.isMythical,
      name: name ?? this.name,
      order: order ?? this.order,
      pokemonColorId: pokemonColorId ?? this.pokemonColorId,
      pokemonHabitatId: pokemonHabitatId ?? this.pokemonHabitatId,
      pokemonShapeId: pokemonShapeId ?? this.pokemonShapeId,
    );
  }

  factory PokeEntity.fromJson(Map<String, dynamic> json) {
    return PokeEntity(
      baseHappiness: json['base_happiness'] as int,
      captureRate: json['capture_rate'] as int,
      evolutionChainId: json['evolution_chain_id'] as int,
      evolvesFromSpeciesId: json['evolves_from_species_id'] as Null,
      formsSwitchable: json['forms_switchable'] as bool,
      genderRate: json['gender_rate'] as int,
      generationId: json['generation_id'] as int,
      growthRateId: json['growth_rate_id'] as int,
      hasGenderDifferences: json['has_gender_differences'] as bool,
      hatchCounter: json['hatch_counter'] as int,
      id: json['id'] as int,
      isBaby: json['is_baby'] as bool,
      isLegendary: json['is_legendary'] as bool,
      isMythical: json['is_mythical'] as bool,
      name: json['name'] as String,
      order: json['order'] as int,
      pokemonColorId: json['pokemon_color_id'] as int,
      pokemonHabitatId: json['pokemon_habitat_id'] as int,
      pokemonShapeId: json['pokemon_shape_id'] as int,
    );
  }
}
