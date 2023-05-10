import 'package:atom/gen/colors.gen.dart';
import 'package:atom/packages/models/models.dart';
import 'package:atom/packages/models/tile_type.dart';
import 'package:atom/tile/components/components.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    required this.tile,
    required this.width,
    required this.value,
    required this.status,
    required this.isAdmin,
    super.key,
  });

  final Tile tile;
  final double width;
  final String? value;
  final ConnectionStatus? status;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      height: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: ColorName.white,
          foregroundColor: ColorName.XBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    tile.name.toUpperCase(),
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorName.XBlack,
                    ),
                  ),
                ],
              ),
              if (status != null && status!.isConnecting)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 32),
                  child: Text(
                    'Connecting to broker',
                    style:
                        textTheme.labelMedium!.copyWith(color: ColorName.XRed),
                  ),
                )
              else if (status != null && status!.isConnecting)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 4),
                  child: Text(
                    'Reconnecting to broker',
                    style:
                        textTheme.labelMedium!.copyWith(color: ColorName.XRed),
                  ),
                )
              else if (status != null &&
                  status!.isConnected &&
                  tile.type == TileType.text)
                TextWidget(value: value ?? '...')
              else if (status != null &&
                  status!.isConnected &&
                  tile.type == TileType.toggle)
                ToggleWidget(tile: tile, value: value ?? '...')
              else if (status != null &&
                  status!.isConnected &&
                  tile.type == TileType.button)
                ButtonWidget(tile: tile, value: value ?? '...')
            ],
          ),
        ),
      ),
    );
  }
}
