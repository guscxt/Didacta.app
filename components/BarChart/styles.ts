import { StyleSheet } from "react-native";
import { themas } from "../../src/global/themes";

export const PLOT_HEIGHT = 140;
const AXIS_WIDTH = 28;
const AXIS_GAP = 8;

export const style = StyleSheet.create({

    card: {
        padding: 16,
        borderRadius: 16,
        borderWidth: 1,
        borderColor: themas.colors.border,
        backgroundColor: themas.colors.card,

        shadowColor: "#000",
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.06,
        shadowRadius: 3,
        elevation: 2,
    },

    title: {
        marginBottom: 16,
        fontSize: 15,
        fontWeight: 'bold',
        color: themas.colors.text,
    },

    empty: {
        paddingVertical: 24,
        textAlign: 'center',
        fontSize: 13,
        color: themas.colors.textMuted,
    },

    plotRow: {
        flexDirection: 'row',
    },

    //Números do eixo vertical (100 a 0)
    axis: {
        width: AXIS_WIDTH,
        height: PLOT_HEIGHT + 12,
        marginTop: -6,
        justifyContent: 'space-between',
        alignItems: 'flex-end',
    },

    axisText: {
        fontSize: 10,
        lineHeight: 12,
        color: themas.colors.textMuted,
    },

    plot: {
        flex: 1,
        height: PLOT_HEIGHT,
        marginLeft: AXIS_GAP,
    },

    gridLine: {
        position: 'absolute',
        left: 0,
        right: 0,
        height: 1,
        backgroundColor: themas.colors.border,
    },

    bars: {
        flexDirection: 'row',
        alignItems: 'flex-end',
        height: PLOT_HEIGHT,
    },

    barColumn: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'flex-end',
    },

    bar: {
        width: '70%',
        maxWidth: 72,
        borderTopLeftRadius: 6,
        borderTopRightRadius: 6,
    },

    labelsRow: {
        flexDirection: 'row',
        marginTop: 8,
    },

    labelsSpacer: {
        width: AXIS_WIDTH + AXIS_GAP,
    },

    labels: {
        flex: 1,
        flexDirection: 'row',
    },

    barLabel: {
        flex: 1,
        textAlign: 'center',
        fontSize: 11,
        color: themas.colors.textMuted,
    },

})
