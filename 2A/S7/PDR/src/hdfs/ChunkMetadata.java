package hdfs;

import formats.Format;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

public class ChunkMetadata implements Serializable {
    public static final int MAX_CRUMB_SIZE = 500<<20;
    public static final int MIN_CRUMB_SIZE = 32;
    public static final int CHUNK_FACTOR = 10*10*10;

    private String fileName;
    private Format.Type type;
    private long baseByte;
    private long sizeBytes;
    private int chunkNumber;
    private int totalChunkNumber;

    // Only for the YAML parser
    public ChunkMetadata() {
    }

    public ChunkMetadata(String fileName, long baseByte, long sizeBytes, Format.Type type, int chunkNumber, int totalNumberChunk) {
        this.fileName = fileName;
        this.baseByte = baseByte;
        this.sizeBytes = sizeBytes;
        this.type = type;
        this.chunkNumber = chunkNumber;
        this.totalChunkNumber = totalNumberChunk;
    }

    public ChunkMetadata(ChunkMetadata c) {
        this.fileName = c.getFileName();
        this.type = c.getType();
        this.baseByte = c.getBaseByte();
        this.sizeBytes = c.getSizeBytes();
        this.chunkNumber = c.getChunkNumber();
        this.totalChunkNumber = c.getTotalChunkNumber();
    }

    // Get the hex string corresponding to a byte array
    public static String bytesToHex(byte[] bytes) {
        byte[] hexChars = new byte[bytes.length * 2];
        final byte[] HEX_ARRAY = "0123456789ABCDEF".getBytes(StandardCharsets.US_ASCII);
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX_ARRAY[v >>> 4];
            hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars, StandardCharsets.UTF_8);
    }

    public int getTotalChunkNumber() {
        return totalChunkNumber;
    }

    public Format.Type getType() {
        return this.type;
    }

    public long getSizeBytes() {
        return sizeBytes;
    }

    public int getChunkNumber() {
        return chunkNumber;
    }

    public String getFileName() {
        return fileName;
    }

    public long getBaseByte() {
        return baseByte;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setType(Format.Type type) {
        this.type = type;
    }

    public void setBaseByte(long baseByte) {
        this.baseByte = baseByte;
    }

    public void setSizeBytes(long sizeBytes) {
        this.sizeBytes = sizeBytes;
    }

    public void setChunkNumber(int chunkNumber) {
        this.chunkNumber = chunkNumber;
    }

    public void setTotalChunkNumber(int totalChunkNumber) {
        this.totalChunkNumber = totalChunkNumber;
    }

    // chunk a file in chunkNumber parts
    // Return an ArrayList of <Offset in file, ChunkMetadata>
    public static ArrayList<ChunkMetadata> chunkFile(String fname, Format.Type type, int totalNumberChunk) throws IOException {
        FileInputStream fis = new FileInputStream(fname);
        long fileSizeBytes = fis.getChannel().size();
        long chunkSizeBytes = fileSizeBytes/totalNumberChunk;
        long totalSkipped = 0;
        int chunkNumber = 0;
        long internalSkipped = 0;

        ArrayList<ChunkMetadata> chunkList = new ArrayList<>();

        while (totalSkipped + chunkSizeBytes < fileSizeBytes) {
            internalSkipped = fis.skip(chunkSizeBytes);
            int read;
            while ((read = fis.read()) != '\n' && read != -1) {
                internalSkipped += 1;
            }
            internalSkipped += 1;
            chunkList.add(new ChunkMetadata(fname, totalSkipped, internalSkipped, type, chunkNumber, totalNumberChunk));
            totalSkipped += internalSkipped;
            chunkNumber++;
        }

        if (totalSkipped + 1 < fileSizeBytes) {
            chunkList.add(new ChunkMetadata(fname, totalSkipped, fileSizeBytes - totalSkipped, type, chunkNumber, totalNumberChunk));
        }

        totalNumberChunk = chunkList.size();
        for (ChunkMetadata cm : chunkList) {
            cm.setTotalChunkNumber(totalNumberChunk);
        }

        return chunkList;
    }

    public static int crumbSize(ArrayList<ChunkMetadata> chunksMetadata) {
        long somme = 0;
        for (ChunkMetadata cm : chunksMetadata) {
            somme += cm.getSizeBytes();
        }

        return Math.min(Math.max(MIN_CRUMB_SIZE, (int) ((somme/chunksMetadata.size())/CHUNK_FACTOR)), MAX_CRUMB_SIZE);
    }

    @Override
    public String toString() {
        return "ChunkMetadata{" +
                "fileName='" + fileName + '\'' +
                ", type=" + type +
                ", baseByte=" + baseByte +
                ", sizeBytes=" + sizeBytes +
                ", chunkNumber=" + chunkNumber +
                ", totalChunkNumber=" + totalChunkNumber +
                '}';
    }
}
